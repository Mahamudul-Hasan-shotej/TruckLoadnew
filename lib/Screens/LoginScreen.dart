import 'package:flutter/material.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Screens/VerificationScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                  Container(
                    child: Positioned(
                      bottom: -80,
                      left: 120,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/backGround.jpg'),
                        radius: 90,
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      bottom: -70,
                      left: 130,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logo.jpg'),
                        radius: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 90),
              color: Colors.white,
              child: Text(
                'TruckLoad',
                style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 30.0,
                  color: Color(0xff2FAB46),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Your mobile number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 110),
                      hintText: '01XXXXXXXXX',
                      fillColor: Color(0xffe0f7fa),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                ),
              ),
            ),
            Container(
              child: Text(
                'An OTP will be sent to this mobile number',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  /*var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new VerificationScreen(
                        PhoneNumber: _PhoneNumberCon.text),
                  );
                  Navigator.of(context).push(route);*/
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 10,
                highlightElevation: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Column(
              children: [
                Text(
                  'Or',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Login with Facebook'),
                  highlightElevation: 20,
                  color: Color(0xffe0f7fa),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Login with Google'),
                  color: Color(0xffe0f7fa),
                  highlightElevation: 20,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                ),
              ],
            )),
          ],
        ),
      )),
    );
  }
}
