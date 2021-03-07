import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Screens/Order/Order.dart';

import '../Dashboard.dart';
import '../TripInfo.dart';

class AddOrder extends StatefulWidget {
  CustomerInfodata customerData;
  AddOrder({this.customerData});
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  CustomerInfodata customerInfodata = CustomerInfodata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xff1BBDB8),
        title: Text(
          'Order Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 300,
          width: 600,
          child: Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(05), // if you need this
                side: BorderSide(
                  color: Color(0xff1BBDB8),
                  width: 1,
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                color: Colors.white,
                height: 250,
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Information',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Firstly, you need to add trip by tapping the "Plus" icon below this screen. you can add more than one trip in a single order. Added orders will be listed in this screen.',
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 70),
        width: 60,
        height: 60,
        child: FloatingActionButton(
            elevation: 05,
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Color(0xff1BBDB8),
                child: Icon(
                  Icons.add,
                  size: 45,
                )),
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Order(customerData: widget.customerData)));
            }),
      ),
    );
  }
}
