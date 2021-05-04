import 'package:truck_load_demo/Models/Services/AdditionalServiceToPackageService.dart';
import 'package:truck_load_demo/ViewModel/OrderData.dart';

class CreateOrder {
  Future createOrder(var data) async {
    final response = await AdditionalDataService.instance.createOrder(data);
    return response;
  }
}
