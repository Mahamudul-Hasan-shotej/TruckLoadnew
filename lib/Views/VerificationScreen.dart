import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
  VerificationScreen({Key key, this.phoneNumber}) : super(key: key);
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    color: Color(0xff2FAB46),
                  ),
                  Positioned(
                    top: 60,
                    left: 40,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 90),
                      child: Text(
                        'TruckLoad',
                        style: TextStyle(
                          fontFamily: 'SecularOne',
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Verify Phone Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Code has been sent to ${widget.phoneNumber}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
