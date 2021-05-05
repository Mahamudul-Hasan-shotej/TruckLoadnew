import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/OrderInfo.dart';
import 'package:truck_load_demo/Views/OrderPlace/Global.dart' as globals;

class IndividualOrder {
  OrderInfo orderInfo = OrderInfo();
  Future<OrderInfo> fetchIndividualOrder() async {
    final response =
        await AdditionalDataService.instance.fetchIndividualOrder(globals.pk);
    orderInfo = orderInfoFromJson(response.body);
    return orderInfo;
  }
}
