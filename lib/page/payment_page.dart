import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/fail_page.dart';
import 'complete_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Payment Page',
              style: TextStyle(
                fontSize: 20, // Customize the font size as needed
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              child: const Text('Complete Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const CompletePage()),
                );
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              child: const Text('Fail Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FailPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}