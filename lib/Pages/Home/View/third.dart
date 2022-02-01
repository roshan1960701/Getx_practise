import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';
import 'package:getx_app/Pages/Home/Controller/second_controller.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller){
                  return Text('${controller.no}');
                }),
            FlatButton(
                color: Colors.cyan,
                onPressed: ()async => Get.find<HomeController>().decreament(), child: Text('Number')),

            const SizedBox(height: 20.0,),
            GetBuilder<SecondController>(
              init: SecondController(),
              builder: (controller){
              return Text('${controller.count}');
            },),
            FlatButton(
                color: Colors.deepOrange,
                onPressed: ()async{
                  Get.find<SecondController>().increament();
                }, child: Center(
              child: Text('click'),
            ))
          ],
        ),
      ),

    );
  }
}
