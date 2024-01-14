import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThanksPage extends StatelessWidget {
  final String transactionId;
  final num totalPrice;

  const ThanksPage(
      {super.key, required this.transactionId, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background Container with red color
            Container(
              color: const Color.fromARGB(255, 0x94, 0x51, 0x31),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
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
                  padding: EdgeInsets.only(top: 65),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(37.0),
                    topRight: Radius.circular(37.0),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
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
              top: 400,
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
              top: 470,
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
            Positioned(
              top: 570,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    'Transaction ID: $transactionId', // Changed text
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors
                          .black, // Set the color you want for the additional text
                      fontSize: 16, // Set the desired font size
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 595,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the content
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 80),
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
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text(
                                '$totalPrice.00',
                                style: const TextStyle(
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
                      'Date: $formattedDate', // Additional text
                      style: const TextStyle(
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
      ),
    );
  }
}
