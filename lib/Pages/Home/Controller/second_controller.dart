import 'package:get/get.dart';

class SecondController extends GetxController{
  var count = 0;

  void increament()async{
    count++;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print('this is second controller');
  }

  @override
  void onClose() {
    super.onClose();
    print('we closed the controller');
  }
}