import 'dart:math';

import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'package:truck_load_demo/Models/OrderFormData.dart';
import 'package:truck_load_demo/Models/SizeConfig.dart';
import 'package:intl/intl.dart';
import 'package:truck_load_demo/Screens/Dashboard.dart';
import 'dart:async';
import 'Global.dart' as globals;

import 'package:truck_load_demo/Screens/Order/ListOfOrder.dart';

class Order extends StatefulWidget {
  CustomerInfodata customerData;
  Orderformdata orderdata;
  Order({
    this.customerData,
    this.orderdata,
  });
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // Variables
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

  //form list
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
  List<TruckType> truckType = [];
  //controllers
  final _ordateController = TextEditingController();
  final _loadingController = TextEditingController();
  final _strdateController = TextEditingController();
  final lengtnController = TextEditingController();
  final typeController = TextEditingController();
  //Model Intances
  Orderformdata orderdata = Orderformdata();

  CustomerInfodata customerInfodata = CustomerInfodata();
  //FORM KEY
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //INIT STATE
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickDate = DateTime.now();
  }

  //Date Picker Fuctions
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

  // Field Fuctions widgets
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
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateOne(context),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
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
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today),
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
                onChanged: (_) => FocusScope.of(context).nextFocus(),
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
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateTwo(context),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
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
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: () => _selectDateThree(context),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
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
              borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
                borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff707070),
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Color(0xffF7F5F5),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Add New Trip',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 500,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Flex(
                        direction: Axis.vertical,
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
                          SizedBox(
                            height: 200,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
                              },
                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text(
                                'Cancel',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  _formKey.currentState.save();
                                  truckAdd();
                                  _showMessageDialoge(context);
                                  //clear();
                                }
                              },
                              color: Color(0xff1BBDB8),
                              textColor: Colors.white,
                              child: Text(
                                'Add to list',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      /* bottomSheet: Padding(
          padding: EdgeInsets.all(40.0),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {
                    truckAdd();
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    } else {
                      _formKey.currentState.save();
                      truckAdd();
                      _showMessageDialoge(context);
                      // clear();
                    }
                  },
                  color: Color(0xff1BBDB8),
                  textColor: Colors.white,
                  child: Text(
                    'Add to list',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        )
        
        */
    );
  }

  _showMessageDialoge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Truck added'),
            content: Text('One trip is added to the list'),
            actions: [
              FlatButton(
                  child: Text(
                    'ok',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfOrder(
                            customerData: widget.customerData,
                            orderdata: orderdata,
                          ),
                        ));
                  })
            ],
          ));

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
    globals.truckType.add(ki);
    orderdata.truckType = globals.truckType;
  }
}
