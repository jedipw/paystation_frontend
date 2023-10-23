import 'dart:convert';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:paystation_frontend/page/list_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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
  final apiUrl = dotenv.env['API_URL']!;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  void initializeCamera() {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraOn = true;
      });
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

  Future<Map<String, dynamic>> fetchPriceAndNameForItem(String item) async {
    var url = Uri.http(apiUrl, 'getProductInfo', {'className': item});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = await json.decode(response.body);
      Map<String, dynamic> output = data.first;
      return output;
    } else {
      throw Exception('Failed to load price for $item');
    }
  }

  void detectItem(image) async {
    var url = Uri.http(apiUrl, 'detect');
    var request = http.MultipartRequest("POST", url);
    // request.fields['user'] = 'blah';
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
        final data = json.decode(res.body).toList().cast<String>();
        Map<String, int> priceCache = {};
        Map<String, String> nameCache = {};
        List<List<dynamic>> outputList = [];

        for (String item in data) {
          if (!priceCache.containsKey(item)) {
            Map<String, dynamic> info = await fetchPriceAndNameForItem(item);
            priceCache[item] = info['productPrice'];
            nameCache[item] = info['productName'];
            outputList.add([1, nameCache[item], priceCache[item]]);
          } else if (priceCache.containsKey(item)) {
            int currentCount = outputList
                .firstWhere((element) => element[1] == nameCache[item])[0];
            outputList.removeWhere((element) => element[1] == nameCache[item]);

            outputList
                .add([currentCount + 1, nameCache[item], priceCache[item]]);
          }
        }


        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ListPage(listOfItems: outputList))).then((res) {
          initializeCamera();
        });
      }
    });
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage!.path.isNotEmpty) {
      setState(() {
        _isFlashOn = false;
        _isCameraOn = false;
        _controller.dispose();
      });
      detectItem(returnedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    var camera = _controller.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

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
                            LoadingAnimationWidget.beat(
                              color: Colors.white,
                              size: 100,
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          _isCameraOn
              ? Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 40, 0, 5),
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(150, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            color: Colors.white,
                            size: 32,
                          ),
                        )
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
              : Container()
        ],
      ),
    );
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
