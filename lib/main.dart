import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_load_demo/Models/Provider/Dashboard/dashBoardOne.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';
import 'package:truck_load_demo/Models/Provider/LockScreen/LockTodoModel.dart';

import 'package:truck_load_demo/Views/SlapshScreen.dart';

//import 'package:truck_load_demo/Screens/LoginScreen.dart';
//import 'package:truck_load_demo/Screens/VerificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MultiProvider(
            providers: [
              ChangeNotifierProvider<LockTodoModel>(
                  create: (context) => LockTodoModel()),
              ChangeNotifierProvider<DashboardDetailsProvider>(
                  create: (context) => DashboardDetailsProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(canvasColor: Colors.transparent),
              home: Scaffold(
                // body: AddOrder(),
                //body: LoginScreenOne(),
                //body: LockScreen(),
                body: Splash(),
              ),
            ));
      });
    });
  }
}
