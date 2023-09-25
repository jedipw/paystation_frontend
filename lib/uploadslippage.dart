import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'thankspage.dart';
import 'transactionfailed.dart';
import 'sumlistpage.dart';

class uploadslippage extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Upload Slip Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),
            
            const SizedBox(height: 16),

            CupertinoButton.filled(
              child: const Text('Thanks Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => thankspage()),
                );
              },
            ),
            SizedBox(height: 16), // Adding some spacing
            CupertinoButton.filled(
              child: const Text('Transactionfailed'),
              onPressed: () {
                 Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => transactionfailed()),
                );
              },
            ),
            SizedBox(height: 16), // Adding some spacing
            CupertinoButton.filled(
              child: const Text('Move Back'),
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
