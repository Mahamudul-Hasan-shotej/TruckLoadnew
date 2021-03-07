import 'dart:ffi';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/OrderFormData.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'package:truck_load_demo/Services/AdditionalServiceToPackageService.dart';

class TripInfo extends StatefulWidget {
  CustomerInfodata customerData;
  TripInfo({this.customerData});
  @override
  _TripInfoState createState() => _TripInfoState();
}

class _TripInfoState extends State<TripInfo> {
  final fieldText = TextEditingController();
  DateTime _ordate;
  DateTime _lndate;
  DateTime _strdate;
  String _loadingPoint;
  String _unloadingPoint;
  String _vehicleType;
  String _vehicleLength;
  String _vehicleWeight;
  int _vehicleQuantity;
  String _truckFare;
  String _driverName;
  DateTime _pickDate;

  final List<String> items = [];

  final _ordateController = TextEditingController();
  final _loadingController = TextEditingController();
  final _strdateController = TextEditingController();
  final lengtnController = TextEditingController();
  final typeController = TextEditingController();
  Orderformdata orderdata = Orderformdata();

  CustomerInfodata customerInfodata = CustomerInfodata();
  List<TruckType> truckType = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> length = [
    '7ft',
    '9ft',
    '12ft',
    '16ft',
    '23ft',
  ];
  List<String> type = [
    'Covered',
    'Van',
  ];

  void clear() {
    _formKey.currentState.reset();
    _ordateController.clear();
    _loadingController.clear();
    _strdateController.clear();
    typeController.clear();
    lengtnController.clear();
  }

  _showMessageDialoge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Truck added'),
            content: Text('One truck is added to the List'),
            actions: [
              FlatButton(
                  child: Text('ok'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ));
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
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  highlightElevation: 20,
                )
              ],
            ),
          );
        });
  }

  _showModalButtomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: ListView.builder(
                      itemCount: orderdata.truckType.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              'Please Review Trip: ${index + 1}',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SecularOne',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 200,
                              padding: EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffEAFFEE),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Truck Type',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Loading point',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Unloading point',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Driver name',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            orderdata.truckType[index].type,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            orderdata.truckType[index]
                                                .truckLoadingPoint,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            orderdata.truckType[index]
                                                .truckUnloadingPoint,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            orderdata
                                                .truckType[index].driverName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Center(
                    child: Row(
                      children: [
                        RaisedButton(
                            color: Colors.red,
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                            color: Color(0xff1BBDB8),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            onPressed: () {
                              AdditionalDataService.createOrder(orderdata)
                                  .then((response) {
                                if (response.statusCode == 200) {
                                  _showModalButtomSheetSuccess(context);
                                } else {
                                  print('Sorry your data in not submitted');
                                }
                              });
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickDate = DateTime.now();
  }

  Future<Null> _selectDateOne(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green),
            child: child,
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        print(_pickDate);

        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        //var date =
        //   "${_pickDate.toLocal().year}-${_pickDate.toLocal().month}-${_pickDate.toLocal().day}";
        _ordateController.text = formattedDate;
      });
    }
  }

  Future<Null> _selectDateTwo(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green),
            child: child,
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        _loadingController.text = formattedDate;
      });
    }
  }

//Celender properties
  Future<Null> _selectDateThree(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _pickDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Colors.green,
                accentColor: Colors.green),
            child: child,
          ),
        );
      },
    );
    if (_datePicker != null && _datePicker != _pickDate) {
      setState(() {
        _pickDate = _datePicker;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_datePicker);
        _strdateController.text = formattedDate;
      });
    }
  }

// custom form widgets
  Widget _buildOrdate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateOne(context),
              child: TextFormField(
                onTap: () {
                  _selectDateOne(context);
                },
                controller: _ordateController,
                keyboardType: TextInputType.datetime,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 2),
                    hintText: "Select date",
                    suffix: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      onPressed: () {
                        setState(() {
                          _selectDateOne(context);
                        });
                      },
                      icon: Icon(Icons.calendar_today),
                      splashColor: Colors.green,
                      iconSize: 15,
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _ordate = DateTime.parse((value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLndate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loading date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateTwo(context),
              child: TextFormField(
                onTap: () {
                  _selectDateTwo(context);
                },
                controller: _loadingController,
                keyboardType: TextInputType.datetime,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 2),
                    hintText: "Select Date",
                    suffix: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      onPressed: () {
                        setState(() {
                          _selectDateTwo(context);
                        });
                      },
                      icon: Icon(Icons.calendar_today),
                      splashColor: Colors.green,
                      iconSize: 15,
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _lndate = DateTime.parse(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrdate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Starting date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateThree(context),
              child: TextFormField(
                onTap: () {
                  _selectDateThree(context);
                },
                controller: _strdateController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 2),
                    hintText: "Select Date",
                    suffix: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      onPressed: () {
                        setState(() {
                          _selectDateThree(context);
                        });
                      },
                      icon: Icon(Icons.calendar_today),
                      splashColor: Colors.green,
                      iconSize: 15,
                    )),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Date is required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _strdate = DateTime.parse(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLodingPoint() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loading point',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter loading point"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Loading point is required';
                }
                return null;
              },
              onSaved: (String value) {
                _loadingPoint = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnLodingPoint() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Unloading point',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter Unloading point"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Loading point is required';
                }
                return null;
              },
              onSaved: (String value) {
                _unloadingPoint = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVtype() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  underline: Container(color: Colors.transparent),
                  items: type.map((String dropDownItems) {
                    return DropdownMenuItem<String>(
                      value: dropDownItems,
                      child: Text(dropDownItems),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._vehicleType = newValueSelected;
                    });
                  },
                  value: _vehicleType,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildVlength() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehucle length',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                items: length.map((String dropDownItems) {
                  return DropdownMenuItem<String>(
                    value: dropDownItems,
                    child: Text(dropDownItems),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._vehicleLength = newValueSelected;
                  });
                },
                value: _vehicleLength,
                isExpanded: true,
                dropdownColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVweight() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter vehicle weight"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Vehicle weight is required';
                }
                return null;
              },
              onSaved: (String value) {
                _vehicleWeight = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVquantity() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vehicle quantity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter vehicle quantity"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Vehicle quantity is required';
                }
                return null;
              },
              onSaved: (value) {
                _vehicleQuantity = int.parse(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildtruckfare() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Truck fare',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter Truck Fare"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Truck is required';
                }
                return null;
              },
              onSaved: (String value) {
                _truckFare = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Driver Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hoverColor: Colors.black,
                  hintText: "Enter driver name"),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Driver name is required';
                }
                return null;
              },
              onSaved: (String value) {
                _driverName = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF7F5F5),
        appBar: AppBar(
          title: Text(
            'Order Info',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff1BBDB8),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 05, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  } else {
                    _formKey.currentState.save();
                    truckAdd();
                    _showMessageDialoge(context);
                    // clear();
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(05),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildOrdate(),
                      _buildLndate(),
                      _buildStrdate(),
                      _buildLodingPoint(),
                      _buildUnLodingPoint(),
                      _buildVtype(),
                      _buildVlength(),
                      _buildVweight(),
                      _buildVquantity(),
                      _buildtruckfare(),
                      _buildDriverName(),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                color: Color(0xff1BBDB8),
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 95),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Review Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () {
                  if (orderdata.truckType == null) {
                    return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Nothing to review'),
                              content: Text('There is no truck request'),
                              actions: [
                                FlatButton(
                                    child: Text('ok'),
                                    onPressed: () => Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard())))
                              ],
                            ));
                  } else {
                    _showModalButtomSheet(context);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        /*   floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_drop_down),
            backgroundColor: Colors.green,
            onPressed: () {}),*/
      ),
    );
  }

  void truckAdd() {
    orderdata.createdDate = _ordate;
    orderdata.customerId = widget.customerData.data[0].customerId;
    orderdata.customerType = widget.customerData.data[0].type;
    orderdata.email = widget.customerData.data[0].email;
    orderdata.name = widget.customerData.data[0].name;
    orderdata.numberOfConsignment = '1';
    orderdata.createdDate = _ordate;
    orderdata.orderDate = _pickDate;
    orderdata.orderId = '1612775053612_tstj_order';
    orderdata.orientation = "order";
    orderdata.phone = widget.customerData.data[0].phone;
    orderdata.pk = widget.customerData.data[0].pk;
    orderdata.previousStatus = 'ordersPlaced';
    orderdata.sk = widget.customerData.data[0].sk;
    orderdata.status = 'ordersPlaced';
    orderdata.updatedBy = widget.customerData.data[0].email;

    var ki = TruckType(
      cbm: '32',
      driverName: _driverName,
      length: _vehicleLength,
      quantity: _vehicleQuantity,
      truckFare: _truckFare,
      truckLoadingDate: _lndate,
      truckLoadingPoint: _loadingPoint,
      truckStartingDate: _strdate,
      truckUnloadingPoint: _unloadingPoint,
      type: _vehicleType,
      weight: _vehicleWeight,
    );
    truckType.add(ki);
    orderdata.truckType = truckType;
  }
}
