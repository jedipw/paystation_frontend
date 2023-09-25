import 'package:flutter/material.dart';

class FailPage extends StatelessWidget {
  const FailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Transaction failed Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
