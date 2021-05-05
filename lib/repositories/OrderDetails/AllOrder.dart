import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/OrderData.dart';
import 'package:truck_load_demo/ViewModel/OrderInfo.dart';
import 'package:truck_load_demo/Views/OrderPlace/Global.dart' as globals;

class AllOrder {
  OrderData allOrderInfo = OrderData();
  Future<OrderData> fetchAllOrder() async {
    final response =
        await AdditionalDataService.instance.fetchAllOrder(globals.pk);
    allOrderInfo = orderDataFromJson(response.body);
    return allOrderInfo;
  }
}
