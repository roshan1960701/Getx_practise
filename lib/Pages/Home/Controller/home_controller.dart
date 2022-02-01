import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var count = 0.obs; // To make variable observable
  final RxString rxstring = 'Hello'.obs;
   RxBool like = false.obs;
   RxBool theme = false.obs;



  void increment(){
    count++;
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



}