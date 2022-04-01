import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final homeController  = Get.find<HomeController>();

  Future<bool> onWillPop()async{
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                height: 40.0,
                  color: Colors.cyan,
                  child: Text('Add'),
                  onPressed: ()async{
                  homeController.newList.add('New Here');
                  }
              ),
              Obx(
                      () => Column(
                      children: List.generate(homeController.newList.length, (index) {
                        return Container(
                          margin: EdgeInsets.all(10.0),
                          height: 100,
                          color: Colors.deepPurpleAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${homeController.newList[index]}'),
                              GestureDetector(
                                child: Text('Delete'),
                                onTap: () => homeController.newList.removeAt(index),
                              )
                            ],
                          ),
                        );
                      })
                  )
              )
            ],
          ),
        ),
    )),
    );
  }
}
