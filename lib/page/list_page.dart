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
            padding: const EdgeInsets.fromLTRB(15, 60, 0, 0), // Adjust the left padding as needed
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
                padding: EdgeInsets.only(top: 65), // Adjust the top padding as needed
                child: Text(
                  'PayStation',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 25, // Text size
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
                color: Colors.white, // Change this color to the background color you want
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37.0),
                  topRight: Radius.circular(37.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 25), // Adjust the padding as needed
                    child: Text(
                      'KMUTT Bookstore',
                      style: TextStyle(
                        fontSize: 25, // Customize the font size as needed
                      ),
                    ),
                  ),
                  // Add the custom painted dashed line with padding
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0), // Adjust the padding as needed
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
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Item', // Add your custom text here
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 135),
                      Text(
                        'Price', // Add your custom text here
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0), // Adjust the padding as needed
                    child: CustomPaint(
                      size: const Size(double.infinity, 16),
                      painter: DashedLinePainter(),
                    ),
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 60),
                      Text(
                        '2',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 35),
                      Text(
                        'MONAMI Jumbo \nhighlighter', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 45),
                      Text(
                        '80.00', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 60),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 35),
                      Text(
                        'Sharpie SNote', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        '60.00', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                   const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 60),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 35),
                      Text(
                        'Sakura acrylic color', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        '39.00', // Add your custom text here
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0), // Adjust the padding as needed
                    child: CustomPaint(
                      size: const Size(double.infinity, 16),
                      painter: DashedLinePainter(),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 45),
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Text color
                        ),
                      ),
                      SizedBox(width: 170),
                      Text(
                        '259.00', // Add your custom text here
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Text color
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 0), // Adjust the padding as needed
                    child: CustomPaint(
                      size: const Size(double.infinity, 16),
                      painter: DashedLinePainter(),
                    ),
                  ),
                ],
              ),
            ),
            
          ),
          // Rounded Button with Green Color at the Bottom
          Positioned(
            bottom: 60, // Adjust the bottom position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 276, // Adjust the width as needed
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0x1C, 0x85, 0x0A), // Green color for the button
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextButton(
                  child: const Text(
                    'CONFIRM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentPage()),
                    );
                  },
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
