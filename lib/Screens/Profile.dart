import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Order/Global.dart' as globals;
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/TripInfo.dart';
import 'package:truck_load_demo/Screens/addEmployee.dart';

import 'Dashboard.dart';

class Profile extends StatefulWidget {
  CustomerInfodata customerData;
  Profile({this.customerData});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color(0xff1BBDB8),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  globals.bottomNavIndex = 0;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xffF7F5F5),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff1BBDB8),
                          radius: 50,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage('images/profile.png'),
                              radius: 40,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      widget.customerData.data[0].name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      widget.customerData.data[0].type,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 5,
                        child: Container(
                            height: 100,
                            width: 400,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email Address',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.customerData.data[0].email,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'SecularOne'),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 5,
                        child: Container(
                            height: 100,
                            width: 400,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.customerData.data[0].phone,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'SecularOne'),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 5,
                        child: Container(
                            height: 100,
                            width: 400,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer ID',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.customerData.data[0].customerId,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'SecularOne'),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
