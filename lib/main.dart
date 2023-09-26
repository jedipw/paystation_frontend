import 'package:camera/camera.dart';
import 'package:paystation_frontend/page/camera_page.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    title: 'PayStation',
    home: CameraPage(cameras: cameras),
  ));
}
