import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/DashboardOne.dart';
import 'package:truck_load_demo/Models/DashboardTwo.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';

class OrderModalButtom {
  showModalBottomSheetOrder(context, DashBoardtwo datatwo) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          if (datatwo.data == null) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xffF7F5F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xffF7F5F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth / 3.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                child: FlatButton(
                                    child: Text(
                                      ' Order \n Placed',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 50, horizontal: 10),
                                    splashColor: Colors.green,
                                    onPressed: () {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                  child: Text(
                                    datatwo.data[0].value,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: SizeConfig.screenWidth / 3.22,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 05,
                            child: FlatButton(
                                child: Text(
                                  'Details\n'
                                  'Collected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 10),
                                splashColor: Colors.green,
                                onPressed: () {}),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth / 3.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                child: FlatButton(
                                    child: Text(
                                      'Order\nConfirmed',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 50, horizontal: 10),
                                    splashColor: Colors.green,
                                    onPressed: () {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                  child: Text(
                                    datatwo.data[2].value,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth / 3.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                child: FlatButton(
                                    child: Text(
                                      'In\nTransit',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 50, horizontal: 20),
                                    splashColor: Colors.green,
                                    onPressed: () {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                  child: Text(
                                    datatwo.data[3].value,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: (SizeConfig.screenWidth / 3.2) * 2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: FlatButton(
                                child: Text(
                                  'Consignment\nDone',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                splashColor: Colors.green,
                                onPressed: () {}),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
