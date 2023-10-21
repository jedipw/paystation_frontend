import 'package:flutter/material.dart';
import 'payment_page.dart';

class ListPage extends StatelessWidget {
  final List<String> listOfItems;
  const ListPage({super.key, required this.listOfItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
            TextButton(
              child: const Text('Payment Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
