import 'package:flutter/material.dart';
import 'package:paystation_frontend/constants/color.dart';

class FailPage extends StatelessWidget {
  const FailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Container with red color
          Container(
            color: primaryBrown,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 65),
                child: Text(
                  'PayStation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 134,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37.0),
                  topRight: Radius.circular(37.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 150, // Adjust the size of the circle as needed
                height: 150, // Adjust the size of the circle as needed
                decoration: const BoxDecoration(
                  color: primaryRed,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '!',
                    style: TextStyle(
                      color: Colors
                          .white, // Set the color you want for the exclamation mark
                      fontSize: 110, // Set the desired font size
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 400, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Transaction Failed',
                style: TextStyle(
                  color: Colors.black, // Set the color you want for the text
                  fontSize: 35, // Set the desired font size
                  fontWeight: FontWeight.bold, // Make the text bold
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          const Positioned(
            top: 476, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Please try a different payment method',
                style: TextStyle(
                  color: Colors
                      .black, // Set the color you want for the additional text
                  fontSize: 19, // Set the desired font size
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 650.0), // Add space above the button
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    darkBrown, // Green color for the button
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(276, 0), // Set the minimum width to 276
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
