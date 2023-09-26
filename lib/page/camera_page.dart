import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/list_page.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: CameraPreview(_controller),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(150, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    onTap: () async {
                      if (!_controller.value.isInitialized) {
                        return;
                      }
                      if (_controller.value.isTakingPicture) {
                        return;
                      }

                      try {
                        await _controller.setFlashMode(FlashMode.auto);
                        XFile picture = await _controller.takePicture();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListPage()),
                        );
                      } on CameraException catch (e) {
                        debugPrint("Error occured while taking picture: $e");
                        return;
                      }
                    },
                  ),
                ],
              ),
            ),
          )
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
          margin: EdgeInsets.all(2.0), // Adjust the margin as needed
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
