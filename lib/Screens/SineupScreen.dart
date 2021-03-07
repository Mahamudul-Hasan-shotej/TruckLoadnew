// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/EmailValidator.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Screens/LoginScreen.dart';
import 'package:truck_load_demo/Screens/LoginScreenOne.dart';
import 'package:truck_load_demo/Screens/VerificationScreen.dart';

class SineUpScreen extends StatefulWidget {
  @override
  _SineUpScreenState createState() => _SineUpScreenState();
}

class _SineUpScreenState extends State<SineUpScreen> {
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
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
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          !validateEmail(value) ? "Email is Invalid" : null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value.isEmpty ? "Password is invalid" : null,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  _loginButtonPressed(context);
                },
                child: Text(
                  'Sine up',
                  style: TextStyle(
                    fontSize: 20,
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
          ],
        ),
      )),
    );
  }

  Future<void> _loginButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _passController.text;
      try {
        var sineUpResult = await Amplify.Auth.signUp(
            username: email,
            password: password,
            options: CognitoSignUpOptions(userAttributes: {'email': email}));
        if (sineUpResult.isSignUpComplete) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginScreenOne()));
        }
      } on AuthError catch (e) {
        _scafoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.cause),
          ),
        );
      }
    }
  }
}
