import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';
import 'package:getx_app/Pages/Home/View/secondPage.dart';
import 'package:getx_app/Services/api_service.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///inject APi service i.e it will create instance inside Get
  // final apiService = Get.put(ApiService());

  // inject state inside homeView
  // final homeController = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    final apiService = Get.find<ApiService>();
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text('${homeController.rxstring}'),),
             Obx(() => Text('${homeController.count}',style: const TextStyle(
               fontSize: 18.0,
               color: Colors.red,
             ),),),
            InkWell(
              child: Container(
                height: 40.0,
                width: 100.0,
                color: Colors.purple,
                child: const Center(
                  child: Text('Next'),
                ),),
              onTap: () {
                // Get.to(const SecondScreen());
                // Get.toNamed('/second');
                homeController.increment();
                },
            ),
            const SizedBox(height: 10.0,),
            FlatButton(
                color: Colors.red,
                onPressed: ()async{
                  homeController.setName();
              // Get.snackbar('Hey','This is snackbar',snackPosition: SnackPosition.BOTTOM,);
            }, child: Text('Click')),
            Obx( () => IconButton(onPressed: () async => homeController.getLike(), icon: Icon(Icons.whatshot,size: 40.0,color:  homeController.like.isTrue ? Colors.red : Colors.yellow,))),
            const SizedBox(height: 10.0,),
            FlatButton(
                color: Colors.green,
                onPressed: ()async{
                  homeController.theme.isTrue ? homeController.changeTheme(ThemeData.dark()) : homeController.changeTheme(ThemeData.light());
                }, child: Text('Change Theme')),

            const SizedBox(height: 10.0,),
            FlatButton(
                color: Colors.pinkAccent,
                onPressed: ()async{
                  Get.toNamed('/second');
                }, child: Text('Next')),

            const SizedBox(height: 10.0,),
            FlatButton(
                color: Colors.deepPurpleAccent,
                onPressed: ()async{
                  Get.toNamed('/third');
                }, child: Text('Next')),


          ],
        ),
      ),


    );
  }
}
