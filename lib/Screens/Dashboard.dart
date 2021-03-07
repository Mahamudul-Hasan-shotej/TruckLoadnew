import 'dart:async';
import 'dart:convert';

import 'package:truck_load_demo/BottomScreen/OrderButtomModalSheet.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:truck_load_demo/BottomScreen/orderButtom.dart';
import 'package:truck_load_demo/Models/ChartDataConsumtion.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/DashboardOne.dart';
import 'package:truck_load_demo/Models/DashboardTwo.dart';
import 'package:truck_load_demo/Models/OrderData.dart';
import 'package:truck_load_demo/Models/OrderFormData.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/LoginScreenOne.dart';
import 'package:truck_load_demo/Screens/Order/AddOrder.dart';
import 'package:truck_load_demo/Screens/OrderHistory.dart';
import 'package:truck_load_demo/Screens/Profile.dart';
import 'package:truck_load_demo/Screens/TripInfo.dart';
import 'package:truck_load_demo/Screens/addEmployee.dart';
import 'Order/Global.dart' as globals;

import 'package:truck_load_demo/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/widgets/data_cart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map mapResponse;
  static List<int> listOfdata =
      List(7); //list for parsing the Dshboaard two data to int
  String pk;
  String mail;
  OrderModalButtom modalButtom = OrderModalButtom();
  DashBoardOne dataone = DashBoardOne();
  DashBoardtwo datatwo = DashBoardtwo();
  OrderData orderData = OrderData();
  CustomerInfodata customerInfodata = CustomerInfodata();

  @override
  void initState() {
    getdata();
    super.initState();
  }

  //getting the data from model through Api service
  getdata() async {
    var info = await Amplify.Auth.getCurrentUser();
    //mail = info.username;
    mail = 'bata2@gmail.com'; // as Data is not updated
    customerInfodata = await AdditionalDataService.fetchClientInfo(mail);
    if (customerInfodata.data.isNotEmpty) {
      pk = customerInfodata.data[0].pk;
      print(pk);
    } else {
      print('No Data in user thread');
    }

    dataone = await AdditionalDataService.fetchDataOne(pk);
    //print(dataone.data[0].value);
    datatwo = await AdditionalDataService.fetchDatatwo(pk);
    orderData = await AdditionalDataService.fetchOrder();
    

    //print('Name of client ${customerInfodata.data[0].name}');
    int length = datatwo.data.length;

    if (datatwo.data.isNotEmpty) {
      for (int i = 0; i < length; i++) {
        listOfdata[i] = int.parse(datatwo.data[i].value);
      }
    }

    //print(datatwo.data[0].label);
  }

  //Sending the listOfData and colour to BarChart
  final List<ChartDataConsumtion> data = [
    ChartDataConsumtion(
        data: listOfdata[0],
        //data: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
        title: "1"),
    ChartDataConsumtion(
        data: listOfdata[1],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffFCAE00)),
        title: "2"),
    ChartDataConsumtion(
        data: listOfdata[2],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffE80000)),
        title: "3"),
    ChartDataConsumtion(
        data: listOfdata[3],
        barColor: charts.ColorUtil.fromDartColor(Color(0xffFA80FA)),
        title: "4"),
    ChartDataConsumtion(
        data: listOfdata[4],
        barColor: charts.ColorUtil.fromDartColor(Color(0xff8613C3)),
        title: "5"),
    ChartDataConsumtion(
        data: listOfdata[5],
        barColor: charts.ColorUtil.fromDartColor(Color(0xff00BDE0)),
        title: "6"),
    ChartDataConsumtion(
        data: listOfdata[6],
        barColor: charts.ColorUtil.fromDartColor(Color(0xff316BED)),
        title: "7"),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.screenHeight); //printing screen hight and weight
    print(SizeConfig.screenWidth);

    final iconList = <IconData>[
      Icons.home,
      Icons.shopping_bag,
      Icons.list_alt,
      Icons.person,
    ];
    final textList = ['Home', 'Orders', 'History', 'Profile'];

    return Scaffold(
        backgroundColor: Color(0xffF7F5F5),
        body: RefreshIndicator(
          onRefresh: refresh,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.22,
                        width: SizeConfig.screenWidth,
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        color: Color(0xff1BBDB8),
                      ),
                      Positioned(
                        left: 4,
                        top: SizeConfig.screenHeight * 0.1,
                        child: Container(
                          height: 50,
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          child: Text(
                            'TruckLoad',
                            style: TextStyle(
                              fontFamily: 'SecularOne',
                              fontSize: 34.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 300,
                        top: SizeConfig.screenHeight * 0.1,
                        child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                _sineoutButtonPressed(context);
                              },
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: SizeConfig.screenHeight * 0.18,
                  child: FutureBuilder(
                      future: AdditionalDataService.fetchDataOne(pk),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            DashBoardOne dashBoardOne = snapshot.data;
                            return Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  cardviews(
                                      dashBoardOne.data[0].value, "Successful"),
                                  SizedBox(
                                    width: 5,
                                  ), //sending data and status to the card view
                                  cardviews(
                                      dashBoardOne.data[1].value, "Cancelled"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  cardviews(dashBoardOne.data[2].value,
                                      "On Progress"),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }

                          //
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
                Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Order Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                // Positioned(
                //   left: 100,
                //   child: Text('Order Status'),
                // ),
                Container(
                  // color: Color(0xffEAFFEE),
                  // height: 150,
                  // width: 200,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05, vertical: 0),

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 05,
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.30,
                          width: SizeConfig.screenWidth,
                          child: DataChart(
                            // setting bar chart in a container
                            data: data,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 8,
          backgroundColor: Color(0xff1BBDB8),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddOrder(customerData: customerInfodata)));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            height: 60,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? Color(0xff1BBDB8) : Color(0xffbdbdbd);
              final fontcolor = isActive ? Colors.black : Color(0xffbdbdbd);
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconList[index],
                      size: 25,
                      color: color,
                    ),
                    Text(
                      textList[index],
                      style: TextStyle(
                          fontSize: 10,
                          color: fontcolor,
                          fontWeight: FontWeight.bold),
                    )
                  ]);
            },
            activeIndex: globals.bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 10,
            rightCornerRadius: 10,
            onTap: (index) {
              setState(() {
                globals.bottomNavIndex = index;
              });
              if (index == 1) {
                modalButtom.showModalBottomSheetOrder(context, datatwo);
              } else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              customerData: customerInfodata,
                            )));
              } else if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderHistory(orderData: orderData,)));
              }
            }));
  }

  Future<void> _sineoutButtonPressed(BuildContext context) async {
    try {
      final signOutResult = await Amplify.Auth.signOut();

      if (signOutResult != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreenOne()));
      }
    } on AuthError catch (e) {
      print(e);
    }
  }

  Container cardviews(String data, String heading) {
    return Container(
      width: 140,
      height: 40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 02,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(
                data,
                style: TextStyle(
                  //fontFamily: 'SecularOne',
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xff1BBDB8),
                ),
              ),
              SizedBox(
                height: 08,
              ),
              Text(
                heading,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> refresh() async {
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(seconds: 2)).then((_) {
      completer.complete();
    });

    return completer.future;
  }
}
