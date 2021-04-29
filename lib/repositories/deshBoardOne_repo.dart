import 'dart:io';

import 'package:amplify_flutter/amplify.dart';
import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

class DashBoardRepo {
  DashBoardOne resOne = DashBoardOne();
  CustomerInfodata customerInfodata = CustomerInfodata();

  Future<CustomerInfodata> fetchCustomerInfo() async {
    var info = await Amplify.Auth.getCurrentUser();
    var mail = info.username;
    final response = await AdditionalDataService.instance.fetchClientInfo(mail);
    customerInfodata = customerInfodataFromJson(response.body);
    if (customerInfodata.data.isNotEmpty) {
      globals.pk = customerInfodata.data[0].pk;
    } else {
      print('No Data in user thread');
    }

    return customerInfodata;
  }

  Future<DashBoardOne> fetchDashboardOneDetais() async {
    if (customerInfodata.data!=null) {
      globals.pk = customerInfodata.data[0].pk;
    } else {
      print('No Data in user thread');
    }
    final response =
        await AdditionalDataService.instance.fetchDashboardOneData(globals.pk);
    print("Response - $response");
    resOne = dashBoardOneFromJson(response.body);

    return resOne;
  }
}
