import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var count = 0.obs; // To make variable observable
  final RxString rxstring = 'Hello'.obs;
   RxBool like = false.obs;
   RxBool theme = false.obs;
   var no = 100;



  void increment(){
    count++;
  }

  void decreament(){
    no--;
    update();
  }

  void setName(){
  rxstring.value = 'Roshan';
  }

  void getLike()async{
    like.value = !like.value;
  }

  void changeTheme(ThemeData themeData){
    Get.changeTheme(themeData);
    theme.value = !theme.value;
  }

  @override
  void onInit() {
    super.onInit();
    print('this is init method');
  }
}