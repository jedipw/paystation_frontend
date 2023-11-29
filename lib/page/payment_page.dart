import 'package:flutter/material.dart';
import 'package:paystation_frontend/page/fail_page.dart';
import 'package:paystation_frontend/page/thanks_page.dart';


class PaymentPage extends StatelessWidget {
  final String transactionId;
  const PaymentPage({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0x94, 0x51, 0x31),
      body: Stack(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
          child: IconButton(icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }, color: Colors.white,
                ), 


              ),
              const Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
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
                margin: const EdgeInsets.only(top: 170),
                padding: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                
                // child: Column(children: <Widget>[]),
              )
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget> [
              //         Padding(padding: EdgeInsets.only (top: 10),
              //         child: Text(
              //           'Status:',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontFamily: 'Poppins'
              //           ),
              //         ),
              //         )
              //       ],
              //     ))
              //   ],
              // )


        ],
      )
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'Payment Page',
      //         style: TextStyle(
      //           fontSize: 20, // Customize the font size as needed
      //         ),
      //       ),
      //       const SizedBox(height: 16),
      //       TextButton(
      //         child: const Text('Thanks Page'),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (BuildContext context) => const ThanksPage()),
      //           );
      //         },
      //       ),
      //       const SizedBox(height: 16),
      //       TextButton(
      //         child: const Text('Fail Page'),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const FailPage()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
