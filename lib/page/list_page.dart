import 'package:flutter/material.dart';
import 'payment_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
              child: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 25), // Adjust the padding as needed
                      child: Text(
                        'KMUTT Bookstore',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily:
                                'Poppins' // Customize the font size as needed
                            ),
                      ),
                    ),
                    // Add the custom painted dashed line with padding
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 40, 40, 0), // Adjust the padding as needed
                      child: CustomPaint(
                        size: const Size(double.infinity, 16),
                        painter: DashedLinePainter(),
                      ),
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 40),
                        Text(
                          'QTY',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'Poppins' // Text color
                              ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Item', // Add your custom text here
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'Poppins' // Text color
                              ),
                        ),
                        SizedBox(width: 115),
                        Text(
                          'Price', // Add your custom text here
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'Poppins' // Text color
                              ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 10, 40, 0), // Adjust the padding as needed
                      child: CustomPaint(
                        size: const Size(double.infinity, 16),
                        painter: DashedLinePainter(),
                      ),
                    ),

                    Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    const SizedBox(width: 60),
    const Expanded(
      flex: 1, // Added flex property to allow the '2' to expand independently
      child: Text(
        '2',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    ),
    const SizedBox(width: 10), // Added space between '2' and 'MONAMI Jumbo highlighter'
    const Expanded(
      flex: 3, // Added flex property to allow 'MONAMI Jumbo highlighter' to expand
      child: Text(
        'MONAMI Jumbo highlighter',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        overflow: TextOverflow.fade,
      ),
    ),
    Container(
      child: const Align(
        alignment: Alignment.centerRight, // Adjust the alignment to move '80.00' closer to the right edge
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0), // Adjust the padding as needed
          child: Text(
            '80.00', // Add your custom text here
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    ),
  ],
),


                    const SizedBox(height: 20),
                   Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    const SizedBox(width: 60),
    const Expanded(
      flex: 1,
      child: Text(
        '1',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    ),
    const SizedBox(width: 10), // Add space between '1' and 'Sharpie SNote'
    const Expanded(
      flex: 3,
      child: Text(
        'Sharpie SNote',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        overflow: TextOverflow.fade,
      ),
    ),
    Container(
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: Text(
            '60.00',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    ),
  ],
),

                    const SizedBox(height: 20),
                    Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    const SizedBox(width: 60),
    const Expanded(
      flex: 1,
      child: Text(
        '1',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    ),
    const SizedBox(width: 10), // Add space between '1' and 'Sakura acrylic color'
    const Expanded(
      flex: 3,
      child: Text(
        'Sakura acrylic color',
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        overflow: TextOverflow.fade,
      ),
    ),
    Container(
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: Text(
            '39.00',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    ),
  ],
),


                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 10, 40, 0), // Adjust the padding as needed
                      child: CustomPaint(
                        size: const Size(double.infinity, 16),
                        painter: DashedLinePainter(),
                      ),
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(width: 45),
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0), // Adjust the padding as needed
                              child: Text(
                                '259.00', // Add your custom text here
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 15, 40, 0), // Adjust the padding as needed
                      child: CustomPaint(
                        size: const Size(double.infinity, 16),
                        painter: DashedLinePainter(),
                      ),
                    ),

                    // "CONFIRM" button at the end of the Column
                     Padding(
                      padding: const EdgeInsets.only(top: 80.0), // Add space above the button
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0x1C, 0x85, 0x0A), // Green color for the button
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'CONFIRM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0) // Color of the dashed line
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Width of the dashed line

    final double dashWidth = 1.0; // Width of each dash
    final double dashSpace = 2.5; // Space between dashes

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
