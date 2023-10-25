import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Container with red color
          Container(
            color: const Color.fromARGB(255, 0x94, 0x51, 0x31),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(
          //       15, 60, 0, 0), // Adjust the left padding as needed
          //   child: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     color: Colors.white, // Button color
          //   ),
          // ),
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
        ]
      ),
  
    );
  }
}