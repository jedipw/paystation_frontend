import 'package:flutter/material.dart';
import 'payment_page.dart';

class ListPage extends StatelessWidget {
  final List<List<dynamic>> listOfItems;
  ListPage({super.key, required this.listOfItems});

  num calculateTotalPrice() {
    num totalPrice = 0;
    for(int i = 0; i < listOfItems.length; i++) {
      totalPrice = totalPrice + listOfItems[i][0] * listOfItems[i][2];
    }
    return totalPrice;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0x94, 0x51, 0x31),
      body: Stack(
        children: [
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
          Container(
            height: MediaQuery.of(context).size.height - 135,
            margin: const EdgeInsets.only(top: 135),
            padding: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'KMUTT Bookstore',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily:
                                'Poppins' // Customize the font size as needed
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        40, 30, 40, 0), // Adjust the padding as needed
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
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfItems.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 60),
                          Expanded(
                            flex:
                                1, // Added flex property to allow the '2' to expand independently
                            child: Text(
                              listOfItems[index][0].toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Added space between '2' and 'MONAMI Jumbo highlighter'
                          Expanded(
                            flex:
                                3, // Added flex property to allow 'MONAMI Jumbo highlighter' to expand
                            child: Text(
                              listOfItems[index][1],
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Align(
                            alignment: Alignment
                                .centerRight, // Adjust the alignment to move '80.00' closer to the right edge
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      45.0), // Adjust the padding as needed
                              child: Text(
                                "${listOfItems[index][2]}.00"
                                    .toString(), // Add your custom text here
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(width: 45),
                        const Text(
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
                              padding: const EdgeInsets.symmetric(horizontal: 40.0), // Adjust the padding as needed
                              child: Text(
                                "${calculateTotalPrice().toString()}.00", // Add your custom text here
                                style: const TextStyle(
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
 Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 40), // Add space above the button
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
                          'CHECK OUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                             fontFamily: 'Poppins',
                          ),
                        ),
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

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0) // Color of the dashed line
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Width of the dashed line

    const double dashWidth = 1.0; // Width of each dash
    const double dashSpace = 2.5; // Space between dashes

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
