import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';
import 'package:getx_app/Services/api_service.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(HomeController());
        
  }
}