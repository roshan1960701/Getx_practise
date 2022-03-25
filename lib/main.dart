import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Binding/home_binding.dart';
import 'package:getx_app/Pages/Home/View/home.dart';
import 'package:getx_app/Pages/Home/View/secondPage.dart';
import 'package:getx_app/Pages/Home/View/slider_screen.dart';
import 'package:getx_app/Pages/Home/View/third.dart';
import 'package:getx_app/Pages/videoModule/view/video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen(),binding: HomeBinding()),
        GetPage(name: '/second', page: () => const SecondScreen()),
        GetPage(name: '/third', page: () => const ThirdScreen()),
        GetPage(name: '/video', page: () => const VideoScreen()),
        GetPage(name: '/slider', page: () => const SliderScreen()),

      ],
      initialRoute: '/home',

      // home: const HomeScreen(),
    );
  }
}

