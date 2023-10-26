import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Container with red color
          Container(
            color: const Color.fromARGB(255, 0x94, 0x51, 0x31),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(
                15, 60, 0, 0), // Adjust the left padding as needed
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white, // Button color
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 65), // Adjust the top padding as needed
                child: Text(
                  'PayStation',
                  style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 25,
                      fontFamily: 'Pacifico' // Text size
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
                color: Colors
                    .white, // Change this color to the background color you want
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
                  color: Color(0xFF187002),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors
                        .white, // Set the color you want for the check icon
                    size: 110, // Set the desired size for the check icon
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
                'Thank you !', // Changed from "Transaction Failed"
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
            top: 470, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  'Your payment was completed successfully', // Changed text
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors
                        .black, // Set the color you want for the additional text
                    fontSize: 19, // Set the desired font size
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 570, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  'Transaction ID: 202310014vGpF4tKzWkmdKvi5', // Changed text
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors
                        .black, // Set the color you want for the additional text
                    fontSize: 16, // Set the desired font size
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
         const Positioned(
  top: 595, // Adjust the top position as needed
  left: 0,
  right: 0,
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: <Widget>[
            
             Padding(
      padding: EdgeInsets.only(left: 80), // Add padding around the text
      child: Text(
        'Amount Paid',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    ),
          // Add some space between the texts
            Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 100.0), // Adjust the padding as needed
                              child: Text(
                                '259.00', // Add your custom text here
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF187002),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
          ],
        ),
        Text(
          'Date: 15/09/2023', // Additional text
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    ),
  ),
),

        ],
      ),
    );
  }
}
