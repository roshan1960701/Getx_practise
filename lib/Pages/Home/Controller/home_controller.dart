import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var remaining = 16.obs;
  var count = 0.obs; // To make variable observable
  final RxString rxstring = 'Hello'.obs;
  var bannerList = ['1','2','3','4','5','6','7','8'];
   RxBool like = false.obs;
   RxBool theme = false.obs;
   var no = 100;
   var mylist = ['India','Russia','Ireland','Australia','New Zealand','Canada','UK','US'];
   var newList = [].obs;



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

  Stream<int> timer() {
    return Stream.periodic(const Duration(seconds: 1), (_) {
      if (remaining.value != 0) {
        remaining.value--;
      }else if(remaining.value == 0){
        // otpResend.value = true;
      }
      return remaining.value;
    });
  }


  @override
  void onInit() {
    super.onInit();
    remaining.bindStream(timer());
    mylist.forEach((element) {
      newList.add(element);
    });
    print('this is init method');
  }
}