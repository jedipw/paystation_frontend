import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paystation_frontend/page/list_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:pytorch_lite/pytorch_lite.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  bool _isFlashOn = false;
  bool _isCameraOn = false;
  bool _isNoItem = false;
  bool _isRealTime = false;
  final apiUrl = dotenv.env['API_URL']!;
  int cameraCount = 0;
  List<ResultObjectDetection?> objDetect = [];

  // late ModelObjectDetection _objectModel;

  // initPyTorch() async {
  //   _objectModel = await PytorchLite.loadObjectDetectionModel(
  //       "assets/models/detect.torchscript", 20, 640, 640,
  //       labelPath: "assets/labels/labels.txt",
  //       objectDetectionModelType: ObjectDetectionModelType.yolov8);
  // }

  @override
  void initState() {
    super.initState();
    // initPyTorch();
    initializeCamera();
  }

  Future<void> realTimeDetection(objectModel) async {
    XFile image = await _controller.takePicture();

    List<ResultObjectDetection?> objDetection =
        await objectModel.getImagePrediction(
      await image.readAsBytes(),
      minimumScore: 0.1,
    );

    setState(() {
      objDetect = objDetection;
    });

    for (int i = 0; i < objDetect.length; i++) {
      print(
          "$i: Class Name: ${objDetect[i]!.className}, L: ${objDetect[i]!.rect.left}, R: ${objDetect[i]!.rect.right}, T: ${objDetect[i]!.rect.top}, B: ${objDetect[i]!.rect.bottom} , Score: ${objDetect[i]!.score}");
    }
  }

  void initializeCamera() async {
    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    _controller.setFlashMode(FlashMode.off);

    ModelObjectDetection objectModel =
        await PytorchLite.loadObjectDetectionModel(
      "assets/detect.torchscript",
      20,
      640,
      640,
      labelPath: "assets/labels.txt",
      objectDetectionModelType: ObjectDetectionModelType.yolov8,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isCameraOn = true;
        _isNoItem = false;
      });

      Timer.periodic(const Duration(milliseconds: 2000), (Timer timer) {
        // Call your function here
        if (_isRealTime) {
          realTimeDetection(objectModel);
        }
      });

      // Call your function here
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            log("Access was denied");
            break;
          default:
            log(e.description!);
            break;
        }
      }
    });
  }

  void detectItem(image) async {
    var url = Uri.http(apiUrl, 'api/objectDetection/detect');
    var request = http.MultipartRequest("POST", url);
    request.files.add(
      await http.MultipartFile.fromPath(
        'image_file',
        image.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.send().then((response) async {
      if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        final data = json.decode(res.body).toList().cast<List<dynamic>>();

        if (data.isNotEmpty) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ListPage(listOfItems: data))).then((res) {
            initializeCamera();
          });
        } else {
          setState(() {
            _isNoItem = true;
          });
        }
      }
    });
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage!.path.isNotEmpty) {
      setState(() {
        _isRealTime = false;
        _isFlashOn = false;
        _isCameraOn = false;
        _controller.dispose();
      });
      detectItem(returnedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = [];
    final size = MediaQuery.of(context).size;

    stackChildren.addAll(renderBoxes(size));

    var camera = _controller.value;
    // fetch screen size

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = 0.0;
    if (_controller.value.isInitialized) {
      scale = size.aspectRatio * (camera.aspectRatio);
    }

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
              child: _isCameraOn
                  ? CameraPreview(_controller)
                  : Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isNoItem
                                ? const Text(
                                    'No items were detected.',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 16),
                                  )
                                : LoadingAnimationWidget.beat(
                                    color: Colors.white,
                                    size: 100,
                                  ),
                            const SizedBox(height: 50),
                            GestureDetector(
                              onTap: () {
                                initializeCamera();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                height: 50,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    _isNoItem ? 'TRY AGAIN' : 'CANCEL',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          _isRealTime
              ? Stack(
                  children: stackChildren,
                )
              : Container(),
          _isCameraOn
              ? Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 40, 0, 5),
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(150, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isFlashOn = !_isFlashOn;
                              if (_isFlashOn) {
                                _controller.setFlashMode(FlashMode.torch);
                              } else {
                                _controller.setFlashMode(FlashMode.off);
                              }
                            });
                          },
                          icon: Icon(
                            _isFlashOn
                                ? Icons.flash_on_outlined
                                : Icons.flash_off_outlined,
                            color: _isFlashOn ? Colors.yellow : Colors.white,
                            size: 32,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isRealTime = !_isRealTime;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                _isRealTime ? 'REAL TIME' : 'IMAGE',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: _isRealTime
                                        ? Colors.yellow
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    decorationStyle:
                                        TextDecorationStyle.dashed),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.swap_horiz,
                                  color: _isRealTime
                                      ? Colors.yellow
                                      : Colors.white),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          _isCameraOn
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(150, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.image,
                                  size: 50, color: Colors.white),
                              onPressed: () {
                                _pickImageFromGallery();
                              },
                            ),
                            const SizedBox(height: 25)
                          ],
                        ),
                        CircleButton(
                          onTap: () async {
                            if (!_controller.value.isInitialized) {
                              return;
                            }
                            if (_controller.value.isTakingPicture) {
                              return;
                            }

                            try {
                              XFile picture = await _controller.takePicture();
                              setState(() {
                                _isRealTime = false;
                                _isFlashOn = false;
                                _isCameraOn = false;
                                _controller.dispose();
                              });
                              detectItem(picture);
                            } on CameraException catch (e) {
                              debugPrint(
                                  "Error occured while taking picture: $e");
                              return;
                            }
                          },
                        ),
                        const SizedBox(width: 50, height: 50),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  List<Widget> renderBoxes(Size screen) {
    if (objDetect.isEmpty) return [];

    if (screen.isEmpty) return [];

    double factorX = screen.width;
    double factorY = screen.height;

    Color _blue = Colors.blue;

    return objDetect
        .map((re) => Positioned(
            left: re!.rect.left * factorX,
            top: re.rect.top * factorY,
            width: (re.rect.right - re.rect.left) * factorX,
            height: (re.rect.bottom - re.rect.top) * factorY,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: generateColor(re.className!),
                    width: 3,
                  )),
              child: Text(
                "${re.className} ${re.score.toStringAsFixed(2)}",
                style: TextStyle(
                    background: Paint()..color = generateColor(re.className!)),
              ),
            )))
        .toList();
  }

  Color generateColor(String text) {
    // Simple algorithm to generate a color based on the characters of the string
    int hash = 0;
    for (int i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 5) - hash);
    }

    final double hue = (hash % 360).toDouble();
    const double saturation = 0.5; // 0.0 to 1.0
    const double lightness = 0.8; // 0.0 to 1.0

    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const CircleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double size = 75.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Black border around the white circle
            width: 5.0, // Adjust the width as needed
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2.0), // Adjust the margin as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.white, // White border outside the black border
              width: 2.0, // Adjust the width as needed
            ),
          ),
        ),
      ),
    );
  }
}
