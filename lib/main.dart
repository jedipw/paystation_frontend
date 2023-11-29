import 'package:camera/camera.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paystation_frontend/page/camera_page.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  cameras = await availableCameras();
  runApp(MaterialApp(
    title: 'PayStation',
    home: CameraPage(cameras: cameras),
  ));
}
