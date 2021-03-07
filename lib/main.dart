import 'package:flutter/material.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Screens/Order/AddOrder.dart';
import 'package:truck_load_demo/Screens/SineupScreen.dart';
import 'package:truck_load_demo/Screens/TripInfo.dart';
import 'package:truck_load_demo/Screens/addEmployee.dart';
import 'package:amplify_flutter/amplify.dart';

import 'Screens/LoginScreen.dart';
import 'Screens/LoginScreenOne.dart';
//import 'package:truck_load_demo/Screens/LoginScreen.dart';
//import 'package:truck_load_demo/Screens/VerificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.transparent),
      home: Scaffold(
        // body: AddOrder(),
        body: LoginScreenOne(),
        //body: Dashboard(),
        //body: TripInfo(),
      ),
    );
  }
}
