import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/list_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Camera Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),

            const SizedBox(height: 16),
            // Adding some spacing
            TextButton(
              child: const Text('List Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
