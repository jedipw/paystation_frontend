import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'uploadslippage.dart';
import 'main.dart';

class sumlistpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Summary List Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),
            
            const SizedBox(height: 16),

            CupertinoButton.filled(
              child: const Text('Upload Slip'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => uploadslippage()),
                );
              },
            ),
            SizedBox(height: 16), // Adding some spacing
            CupertinoButton.filled(
              child: const Text('Move back'),
              onPressed: () {
                 Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => camerapage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
