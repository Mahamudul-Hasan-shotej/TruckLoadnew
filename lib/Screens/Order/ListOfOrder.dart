import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/OrderFormData.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/Order/Order.dart';
import 'package:truck_load_demo/Services/AdditionalServiceToPackageService.dart';
import 'Global.dart' as globals;
import '../Dashboard.dart';
import '../TripInfo.dart';

class ListOfOrder extends StatefulWidget {
  CustomerInfodata customerData;
  Orderformdata orderdata;

  ListOfOrder({this.customerData, this.orderdata});
  @override
  _ListOfOrderState createState() => _ListOfOrderState();
}

class _ListOfOrderState extends State<ListOfOrder> {
  CustomerInfodata customerInfodata = CustomerInfodata();
  @override
  Widget build(BuildContext context) {
    //globals.orderfromdata.add(widget.orderdata);
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
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Container(
                        height: 500,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ListView.builder(
                          itemCount: globals.truckType.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  height: 160,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Color(0xffE7F8F8),
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.local_shipping,
                                                color: Color(0xff1BBDB8),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    globals.truckType[index]
                                                            .length +
                                                        ', ' +
                                                        globals.truckType[index]
                                                            .weight +
                                                        ', ' +
                                                        globals.truckType[index]
                                                            .type,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Align(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    globals.truckType
                                                        .removeAt(index);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Color(0xffCF2426),
                                                ),
                                              ),
                                            ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        height: 80,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_up_outlined,
                                                  size: 35,
                                                  color: Color(0xff006A66),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  globals.truckType[index]
                                                      .truckLoadingPoint,
                                                  style: TextStyle(
                                                    color: Color(0xff727272),
                                                    fontSize: 15,
                                                    letterSpacing: 1.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  size: 35,
                                                  color: Color(0xff1BBDB8),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  globals.truckType[index]
                                                      .truckUnloadingPoint,
                                                  style: TextStyle(
                                                      color: Color(0xff727272),
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        )),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                        onPressed: () {
                          AdditionalDataService.createOrder(widget.orderdata)
                              .then((response) {
                            if (response.statusCode == 200) {
                              _showModalButtomSheetSuccess(context);
                            } else {
                              print('Sorry your data in not submitted');
                            }
                            globals.truckType.clear();
                          });
                        },
                        child: const Text('Place Order',
                            style: TextStyle(fontSize: 20)),
                        color: Color(0xff1BBDB8),
                        textColor: Colors.white,
                        elevation: 5,
                      ),
                    ),
                  )
                ],
              ))),
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
                      builder: (context) => Order(
                            customerData: widget.customerData,
                            orderdata: widget.orderdata,
                          )));
            }),
      ),
    );
  }

  _showModalButtomSheetSuccess(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Color(0xff1BBDB8),
                  size: 150,
                ),
                Text(
                  'Request Successfull!',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SecularOne',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'We will contact you within short time for further information.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard()));
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xff1BBDB8),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 5,
                  highlightElevation: 10,
                )
              ],
            ),
          );
        });
  }
}
