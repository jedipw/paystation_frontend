import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paystation_frontend/constants/color.dart';
import 'payment_page.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  final List<List<dynamic>> listOfItems;
  const ListPage({super.key, required this.listOfItems});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final apiUrl = dotenv.env['API_URL']!;
  String? transactionId;
  Future<void> addtransaction() async {
    var url = Uri.http(apiUrl, 'api/transaction/createTransaction');
    var totalPrice = calculateTotalPrice();

    var jsonData = jsonEncode({'totalPrice': totalPrice});
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonData);
    final data = json.decode(response.body);
    setState(() {
      transactionId = data['transactionId'];
    });
    for (var i = 0; i < widget.listOfItems.length; i++) {
      var url = Uri.http(
          apiUrl, 'api/productToTransaction/createProductToTransaction');
      var jsonData = jsonEncode({
        'transactionId': data['transactionId'],
        'productName': widget.listOfItems[i][1],
        'quantity': widget.listOfItems[i][0]
      });
      await http.post(url,
          headers: {"Content-Type": "application/json"}, body: jsonData);
    }
  }

  num calculateTotalPrice() {
    num totalPrice = 0;
    for (int i = 0; i < widget.listOfItems.length; i++) {
      totalPrice =
          totalPrice + widget.listOfItems[i][0] * widget.listOfItems[i][2];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrown,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
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
                        style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
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
                        'Item',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Poppins' // Text color
                            ),
                      ),
                      SizedBox(width: 115),
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Poppins' // Text color
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: CustomPaint(
                      size: const Size(double.infinity, 16),
                      painter: DashedLinePainter(),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.listOfItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 60),
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.listOfItems[index][0].toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.listOfItems[index][1],
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45.0),
                                child: Text(
                                  "${widget.listOfItems[index][2]}.00"
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              "${calculateTotalPrice().toString()}.00",
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
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
                    child: CustomPaint(
                      size: const Size(double.infinity, 16),
                      painter: DashedLinePainter(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          primaryGreen,
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(276, 0),
                        ),
                      ),
                      onPressed: () {
                        addtransaction().then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                  transactionId: transactionId!,
                                  totalPrice: calculateTotalPrice(),
                                ),
                              ),
                            ));
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
