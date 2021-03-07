import 'package:http/http.dart' as http;
import 'package:truck_load_demo/Models/CustomerInfodata.dart';
import 'dart:async';

import 'dart:io';

import 'package:truck_load_demo/Models/DashboardOne.dart';
import 'package:truck_load_demo/Models/DashboardTwo.dart';
import 'package:truck_load_demo/Models/OrderData.dart';
import 'package:truck_load_demo/Models/OrderFormData.dart';

String url = 'https://api.truckload.trukiot.com/v1';
DashBoardOne resOne = DashBoardOne();
DashBoardtwo resTwo = DashBoardtwo();
Orderformdata resthree = Orderformdata();

CustomerInfodata resfour = CustomerInfodata();
OrderData resfive = OrderData();

class AdditionalDataService {
  static Future fetchDataOne(String pk) async {
    //https://api.truckload.trukiot.com/v1/g/c/trip?sk=01878787899_bat2_customer
    final response = await http.get('$url/g/c/trip?sk=$pk');
    if (response.statusCode == 200) {
      resOne = dashBoardOneFromJson(response.body);
      return resOne;
    }
  }

  //
  static Future fetchDatatwo(String pk) async {
    final response = await http.get('$url/s/c/trip?sk=$pk');
    if (response.statusCode == 200) {
      resTwo = dashBoardtwoFromJson(response.body);
      return resTwo;
    }
  }
  //https://api.truckload.trukiot.com/v1/all?orientation=customer&email=bata2@gmail.com

  static Future fetchClientInfo(String mail) async {
    final response =
        await http.get('$url/all?orientation=customer&email=$mail');
    if (response.statusCode == 200) {
      resfour = customerInfodataFromJson(response.body);
      return resfour;
    }
  }

  //'https://api.truckload.trukiot.com/v8/object?pk=1614489805683_lgri_order&sk=lease
  static Future fetchOrder() async {
    final response = await http.get(
        'https://api.truckload.trukiot.com/v8/object?pk=1614489805683_lgri_order&sk=lease');
    if (response.statusCode == 200) {
      resfive = orderDataFromJson(response.body);
      return resfive;
    }
  }

  static Future<http.Response> createOrder(var data) async {
    final response = await http.post('$url/order',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: orderformdataToJson(data));
    if (response.statusCode == 200) {
      //resthree = orderformdataFromJson(response.body);
      return response;
    }
    return null;
  }
}
