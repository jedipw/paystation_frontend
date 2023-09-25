import 'package:flutter/cupertino.dart';
import 'sumlistpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CupertinoApp(
    title: 'Navigation Basics',
    home: camerapage(),
  ));
}

class camerapage extends StatelessWidget {
  const camerapage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
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
            CupertinoButton.filled(
              child: const Text('Summary List'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => sumlistpage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

