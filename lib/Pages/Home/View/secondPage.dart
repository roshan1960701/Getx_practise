import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';
import 'package:getx_app/Services/api_service.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  final apiService = Get.find<ApiService>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Second Screen'),
        leading: IconButton(onPressed: (){
          // Get.back();
          // print(apiService.value);
          print(homeController.count);
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<HomeController>(
                init: HomeController(),
                builder: (controller){
              return Text('${controller.count}');
            }),
            FlatButton(onPressed: ()async => Get.find<HomeController>().increment(), child: Text('Count'))

          ],
        ),
      ),
    );
  }
}
