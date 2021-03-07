// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_hub.dart';

import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/EmailValidator.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Screens/SineupScreen.dart';
import 'package:truck_load_demo/Screens/VerificationScreen.dart';
import 'package:truck_load_demo/amplifyconfiguration.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenOne extends StatefulWidget {
  @override
  _LoginScreenOneState createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  bool _isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use

    // Amplify.addPlugins([authPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
      await Amplify.addPlugin(authPlugin);
      await Amplify.configure(amplifyconfig);
    } on AuthError {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

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
                    color: Color(0xff1BBDB8),
                  ),
                  Container(
                    child: Positioned(
                      bottom: -90,
                      left: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/backGround.jpg'),
                        radius: 100,
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      bottom: -80,
                      left: 90,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        backgroundImage: AssetImage('images/truckloadLogo.jpg'),
                        radius: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
              color: Colors.transparent,
              child: Text(
                'TruckLoad',
                style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 30.0,
                  color: Color(0xff1BBDB8),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        hintText: 'Email',
                        fillColor: Color(0xffF7F5F5),
                        filled: true,
                        prefixIcon: Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        hintText: 'Password',
                        fillColor: Color(0xffF7F5F5),
                        filled: true,
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value.isEmpty ? "Password is invalid" : null,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Row(
                children: [
                  Checkbox(
                      value: _isChecked,
                      onChanged: (bool value) {
                        setState(() {
                          _isChecked = value;
                        });
                      }),
                  Text(
                    'Remeber Me',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: RaisedButton(
                onPressed: () {
                  _loginButtonPressed(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                color: Color(0xff1BBDB8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
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
      final email = _emailController.text.trim();
      final password = _passController.text.trim();
      try {
        final signInResult =
            await Amplify.Auth.signIn(username: email, password: password);
        print(signInResult.isSignedIn);

        if (signInResult.isSignedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
        } else {
          print('Sine in unsuccessful');
        }
      } on AuthError catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Sign in failed'),
                  content: Text('Email/Password is incorrect!'),
                  actions: [
                    FlatButton(
                        child: Text('ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ));
      }
    }
  }
}
