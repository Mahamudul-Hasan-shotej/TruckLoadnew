import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:truck_load_demo/Models/Services/api_exceptions.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'dart:async';

import 'dart:io';

import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/ViewModel/DashboardTwo.dart';
import 'package:truck_load_demo/ViewModel/OrderData.dart';
import 'package:truck_load_demo/ViewModel/OrderFormData.dart';
import 'package:truck_load_demo/ViewModel/OrderInfo.dart';

String url = 'https://api.truckload.trukiot.com/v1';
DashBoardOne resOne = DashBoardOne();
DashBoardtwo resTwo = DashBoardtwo();
Orderformdata resthree = Orderformdata();

CustomerInfodata resfour = CustomerInfodata();
OrderData resfive = OrderData();
OrderInfo resorderinfo = OrderInfo();

class AdditionalDataService {
  static final AdditionalDataService _singleton = AdditionalDataService();
  static AdditionalDataService get instance => _singleton;

  Future<dynamic> fetchDashboardOneData(String pk) async {
    var responseJson;
    //https://api.truckload.trukiot.com/v1/g/c/trip?sk=01878787899_bat2_customer
    try {
      final response = await http.get('$url/g/c/trip?sk=$pk');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection'); // TODO
    }
    return responseJson;
  }

  //https://api.truckload.trukiot.com/v1/s/c/trip?sk=$pk
  Future<dynamic> fetchDashboardTwoData(String pk) async {
    var responseJson;
    try {
      final response = await http.get('$url/s/c/trip?sk=$pk');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
  //https://api.truckload.trukiot.com/v1/all?orientation=customer&email=bata2@gmail.com

  Future<dynamic> fetchClientInfo(String mail) async {
    var responseJson;
    try {
      final response =
          await http.get('$url/all?orientation=customer&email=$mail');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection'); // TODO
    }
    return responseJson;
  }

  //'https://api.truckload.trukiot.com/v8/object?pk=1614489805683_lgri_order&sk=lease
  static Future fetchOrder(String pk) async {
    final response = await http
        .get('https://api.truckload.trukiot.com/v1/customer/orders?sk=$pk');
    if (response.statusCode == 200) {
      resfive = orderDataFromJson(response.body);
      return resfive;
    }
  }

  static Future fetchOrderinfo(String pk) async {
    final response = await http
        .get('https://api.truckload.trukiot.com/v1/truck-status?order_id=$pk');
    if (response.statusCode == 200) {
      resorderinfo = orderInfoFromJson(response.body);
      return resorderinfo;
    }
  }

  Future<http.Response> createOrder(var data) async {
    var responseJson;
    try {
      final response = await http.post('$url/order',
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: orderformdataToJson(data));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
