import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/OrderData.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Screens/Order/Global.dart';
import 'package:truck_load_demo/Screens/Order/Order.dart';

import 'Dashboard.dart';

class OrderHistory extends StatefulWidget {
  OrderData orderData;

  OrderHistory({this.orderData});
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderData order = OrderData();
  List<String> formatedDate = [];
  void initState() {
    getdata();
    super.initState();
  }

  getdata() {
    order = widget.orderData;
    for (int i = 0; i < order.data.length; i++) {
      formatedDate
          .add(DateFormat('yyyy-MM-dd').format(order.data[i].createdDate));
    }
  }

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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xffF7F5F5),
              ),
              child: ListView.builder(
                itemCount: order.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: Color(0xffF7F5F5),
                                  title: Center(child: Text("Order List")),
                                  content: SingleChildScrollView(
                                    child: Container(
                                      height: SizeConfig.screenHeight,
                                      width: SizeConfig.screenWidth,
                                      color: Colors.transparent,
                                      child: ListView.builder(
                                        itemCount: order
                                            .data[index].information.length,
                                        itemBuilder: (context, i) {
                                          return Column(children: [
                                            Container(
                                              color: Colors.white,
                                              height: 300,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Trip ID',
                                                        softWrap: false,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                      ),
                                                      Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Text(
                                                          ": " +
                                                              order
                                                                  .data[index]
                                                                  .information[
                                                                      i]
                                                                  .tripId,
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Orientation',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Text(
                                                          ": " +
                                                              order
                                                                  .data[index]
                                                                  .information[
                                                                      i]
                                                                  .orientation,
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Loading point ',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Unloading point',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Rent time',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Registration No',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Vendor ID',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ]);
                                        },
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      child: Text('ok'),
                                      onPressed: () {},
                                    )
                                  ],
                                ));
                      },
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 90,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date: " + formatedDate[index],
                                      ),
                                      SizedBox(
                                        height: 05,
                                      ),
                                      Text(
                                        "Order ID:${widget.orderData.data[index].orderId}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: double.infinity,
                                      width: 70,
                                      color: Color(0xffE7F8F8),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${order.data[index].information.length}",
                                            style: TextStyle(
                                                color: Color(0xff1BBDB8),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text("Trips"),
                                        ],
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
