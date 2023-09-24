import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'uploadslippage.dart';

class transactionfailed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Transactionfailed Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),
            
            const SizedBox(height: 16), 
            // Adding some spacing
            CupertinoButton.filled(
              child: const Text('Move Back'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => uploadslippage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
