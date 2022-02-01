import 'package:get/get.dart';

class HomeController extends GetxController{

  var count = 0.obs; // To make variable observable
  final RxString rxstring = 'Hello'.obs;
   RxBool like = false.obs;



  void increment(){
    count++;
  }

  void setName(){
  rxstring.value = 'Roshan';
  }

  void getLike()async{
    like.value = !like.value;
  }

}