import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/fail_page.dart';
import 'package:paystation_frontend/page/thanks_page.dart';

class PaymentPage extends StatelessWidget {
  final String transactionId;
  const PaymentPage({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
            padding:
                const EdgeInsets.only(top: 135), // Adjust the top padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 20,
                    fontFamily: 'Poppins', // Text size
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8), // Adjust the inner padding as needed
                  child: Container(
                    padding: const EdgeInsets.all(13), // Adjust the padding as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          25), // Adjust the radius as needed
                      color: const Color.fromARGB(255, 178, 0, 0),
                    ),
                    child: const Text(
                      'Waiting for Payment...', // Replace with your actual status
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 20,
                        fontFamily: 'Poppins', // Text size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 135,
            margin: const EdgeInsets.only(top: 210),
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
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    40.0), // Adjust the padding as needed
                            child: Text(
                              "259.00", // Add your custom text here
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
                  const Positioned(
                    top: 470, // Adjust the top position as needed
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          'Please check out at the counter.', // Changed text
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
                    top: 470, // Adjust the top position as needed
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          'OR', // Changed text
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
                    top: 470, // Adjust the top position as needed
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          'Pay with mobile banking', // Changed text
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      50,
                      30,
                      50,
                      20,
                    ), // Add space above the button
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 255, 255),
                          // Green color for the button
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                              color: Color.fromRGBO(0x94, // Red
                            0x51, // Green
                            0x31, // Blue
                            0x80 / 255.0,),
                              // Set the border color here
                              width: 3.0, // Set the border width here
                            ),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(276, 0),
                          // Set the minimum width to 276
                        ),
                      ),
                      onPressed: () {
                        // addtransaction().then((value) => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         PaymentPage(transactionId: transactionId!),
                        //   ),
                        // ));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1234-5678-9012',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.copy_all_outlined,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 30, // Adjust the size as needed
                          ),
                           // Add some space between the icon and text
                          // const Text(
                          //   '1234-5678-9012',
                          //   style: TextStyle(
                          //     color: Color.fromARGB(255, 0, 0, 0),
                          //     fontSize: 22,
                          //     fontFamily: 'Poppins',
                          //   ),
                          // ),
                          // const SizedBox(
                          //     width:
                          //         5),
                          //   Image.asset('./assets/icons/content_copy.png')
                            
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        100, 0, 100, 40), // Add space above the button
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(
                            0x94, // Red
                            0x51, // Green
                            0x31, // Blue
                            0x80 / 255.0, // Alpha (transparency)
                          ), // Green color for the button
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),

                      ),
                      onPressed: () {
                        // addtransaction().then((value) => Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>
                        //             PaymentPage(transactionId: transactionId!),
                        //       ),
                        //     ));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Slip',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.upload,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 30, // Adjust the size as needed
                          ),
                          
                          
                        ],
                      ),
                      // Add some spacing between the icon and text
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0, 50, 0, 40), // Add space above the button
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF684536),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(240, 0), // Set the minimum width to 276
                        ),
                      ),
                      onPressed: () {
                        // addtransaction().then((value) => Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>
                        //             PaymentPage(transactionId: transactionId!),
                        //       ),
                        //     ));
                      },
                      child: const Text(
                        'Confirm',
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
