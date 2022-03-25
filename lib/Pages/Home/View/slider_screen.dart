import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx_app/Pages/Home/Controller/home_controller.dart';
import 'package:getx_app/Pages/videoModule/controller/video_controller.dart';
import 'package:ink_page_indicator/ink_page_indicator.dart';
import 'dart:math' as math;

import 'package:quiver/iterables.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  final homeController = Get.put(HomeController());
  var bannerList = ['1','2','3','4','5','6','7','Apple','Mango','Orange','Banana'];
  var indexList = ['1','2','3','4','5','6',];
  int _sem1 = 0;
  int listView = 0;
  var newDotts;
  var subjectList = ['Physics','Chemistry','C Programming','Java','Maths','Graphs','Structure'];
  String message = "";
  final ScrollController _controller = ScrollController();

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      print("Scroll Start");
      message = "Scroll Start";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      print("Scroll Update");
      message = "Scroll Update";
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    // _controller = ScrollController(initialScrollOffset: 200 * 2);
    setState(() {
      print("Scroll End");
      message = "Scroll End";

    });
  }

  forwardState(){
    setState(() {
      if(listView <indexList.length){
        listView++;
      }
    });
  }

  indicatorState(ScrollMetrics metrics){
    setState(() {
      if(listView <newDotts.length){
        listView++;
      }else if(metrics.pixels == metrics.minScrollExtent){
        listView--;
      }

    });

  }


  var newList = [];
  List<Widget> subjectCard = [];

  List<T> map1<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  void initState() {
    super.initState();
     // _controller = ScrollController(initialScrollOffset: 0.0);
    newDotts = partition(indexList, 4).toList();
    dataLoad(context);
  }

  dataLoad(context){
    var data = [];
    var newBanner = partition(bannerList,4);
    data.addAll(newBanner);
    for(int i = 0 ; i< data.length; i++){
      subjectCard.add(Container(width: 150.0,
        child: LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
              itemCount : data[i].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: constraints.maxWidth / constraints.maxHeight,
              ),
              itemBuilder: (context,index){
                return Container(
                  color: Colors.cyanAccent,
                  margin: EdgeInsets.all(4.0),
                  child: Text(data[i][index]),
                );
              }
          );
        }))
      );
    }

    var data1 = [];
    var newBanner2 = partition(subjectList,4);
    print(newBanner2);
    // newLenght = bannerList.length / 4;
    data.addAll(newBanner2);
    for(int i = 0 ; i< data.length; i++){
      subjectCard.add(Container(
          width: 150.0,
          child: LayoutBuilder(builder: (context, constraints) {
            return GridView.builder(
                itemCount : data[i].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.maxWidth / constraints.maxHeight,
                ),
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.cyanAccent,
                    margin: EdgeInsets.all(4.0),
                    child: Text(data[i][index]),
                  );
                }
            );
          })));
    }


  }


  Widget  bannerSlider(){
    return Container(
      height: 230.0,
      width: MediaQuery.of(context).size.width,
      // color: Colors.purple,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10.0),
              // color: Colors.yellow,
              child:PageView.builder(
                  itemCount: subjectCard.length,
                  padEnds: true,
                  onPageChanged: (index)async{
                    setState(() {
                      _sem1 = index;
                    });
                  },
                  itemBuilder: (context,index){
                  return subjectCard[index];
              })

              /*GridView.builder(
                itemCount: bannerList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.427,
                  // mainAxisExtent: 100.0,
                ),
                itemBuilder: (context, index){
                  var num1 = bannerList.length / 4;
                  // var newList = [];
                  for(int i = 0 ; i< num1.ceil(); i++){
                    newList.add(i);
                  }
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 130.0,
                    padding: EdgeInsets.zero,
                    // margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                    // height: 100,
                    color: Colors.cyan,
                    child: Text(bannerList[index]),
                  );
                },
              )*/,


            ),
          ),



        ],
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          bannerSlider(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: map1<Widget>(subjectCard, (index, url) {
                return Transform(
                    alignment: Alignment.centerRight,
                    transform:Matrix4.rotationZ(
                      math.pi / 4,
                    ),
                    child:  Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _sem1 == index ? Colors.deepPurpleAccent : Colors.deepPurpleAccent.withOpacity(0.2),
                      ),
                    )
                );

              }),
            ),
          ),
          Container(
            height: 50.0,
            // color: Colors.orangeAccent,
            child: Center(
              child: Text(message),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: map1<Widget>(newDotts, (index, url) {
                return Transform(
                    alignment: Alignment.centerRight,
                    transform:Matrix4.rotationZ(
                      math.pi / 4,
                    ),
                    child:  Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: listView == index ? Colors.deepPurpleAccent : Colors.deepPurpleAccent.withOpacity(0.2),
                      ),
                    )
                );

              }),
            ),
          ),
          Container(
            height: 200,
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (scrollNotification){
                print('hello');
                print(scrollNotification.metrics.pixels);
                dynamic a = scrollNotification.metrics.pixels / MediaQuery.of(context).size.width;
                setState(() {
                  listView = a.ceil();
                });
                print('value of index ${a.ceil()}');



                // print();


            /*if(){
              print('forward');
            }*/
               /* if(_controller.position.pixels == _controller.position.maxScrollExtent) {
                  print('max Scroll');
                 *//* setState(() {
                    if(listView >= indexList.length){
                      listView --;
                    }
                  });*//*
                }
                if(_controller.position.pixels == _controller.position.minScrollExtent){
                  print('min Scroll');
                  *//*forwardState();*//*

                }
                 if(_controller.position.userScrollDirection == ScrollDirection.forward){
                   *//*setState(() {
                     if(listView != 0){
                       listView--;
                     }
                   });*//*
                }
                *//*else if(_controller.position.userScrollDirection == ScrollDirection.reverse){
                  print('reverse---');

                }*/
                //   print('max scroll');
                //   // if(listView == newDotts.length){
                //   // }else{
                //   //   listView = listView + 1;
                //   // }
                // }
                /*if (scrollNotification is ScrollStartNotification) {
                 print('start Notification');
               *//*  setState(() {
                   if(listView < newDotts.length -1){
                     listView++;
                     print(listView);
                   }
                 });*//*
                  *//*setState(() {
                    if(listView != 0){
                      listView--;
                    }
                  });*//*
                  // _onStartScroll(scrollNotification.metrics);
                  // indicatorState(scrollNotification.metrics);

                } else if (scrollNotification is ScrollUpdateNotification) {
                  // _onUpdateScroll(scrollNotification.metrics);
                  // indicatorState(scrollNotification.metrics);
                  *//*setState(() {
                    if(listView <newDotts.length -1){
                      listView++;
                    }else
                  });*//*
                } else if (scrollNotification is ScrollEndNotification) {
                  if(_controller.position.pixels > _controller.position.minScrollExtent){
                    print('Scroll right');
                  }
                  print('Scroll End');
                  setState(() {
                    if(listView < newDotts.length -1){
                      listView++;
                      print(listView);
                    }*//*else if( listView == newDotts.length - 1){
                      listView--;
                      listView = 0;
                    }*//*
                    // print(_controller.position);

                  });
                  // _onEndScroll(scrollNotification.metrics);
                  // indicatorState(scrollNotification.metrics);
                }*/

                return false;
              },
              child: Padding(padding:EdgeInsets.only(left: 10.0),
              child: LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                    controller: _controller,
                    itemCount: indexList.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio:constraints.maxHeight /constraints.maxWidth,
                    ), itemBuilder: (context,index){
                  return Container(
                    color: Colors.deepPurpleAccent,
                    child: Center(child: Text("Index : $index")),
                  );
                });
              })),
              )
            ),

        ],
      )
    );
  }
}
