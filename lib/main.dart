import 'package:camera/camera.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paystation_frontend/screens/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:pytorch_lite/pytorch_lite.dart';

late List<CameraDescription> cameras;
late ModelObjectDetection objectModel;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  cameras = await availableCameras();

  runApp(MaterialApp(
    title: 'PayStation',
    home: CameraPage(cameras: cameras),
  ));
}
