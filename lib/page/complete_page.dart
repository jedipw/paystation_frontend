import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/camera_page.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Thank you page',
                style: TextStyle(
                  fontSize: 20, // Customize the font size as needed
                ),
              ),
              const SizedBox(width: 16),
              TextButton(
                child: const Text('Camera Page'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CameraPage()),
                      ModalRoute.withName('/'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
