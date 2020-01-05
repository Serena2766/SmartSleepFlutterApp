import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../player_widget.dart';
import 'discovery.dart';
import 'home.dart';
import 'settings.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Stats extends StatefulWidget {

  @override
  _StatsState createState() => _StatsState();
}

//Version 1 - Online address link to images
//class _StatsState extends State<Stats>{
//  PageController imagePageController;
//  List<String> images = [
//    'https://www.mybestmattress.com/storage/media/images/stomach-sleeper.o.jpg',
//    'https://i.pinimg.com/originals/ef/11/d6/ef11d67c5fc3bc349a92ef947dd6a848.jpg',
//    'https://www.sleepmaker.com.au/wp-content/uploads/2017/08/sleep-positions-back_1180x800.jpg'
////      'assets/sleep-positions-back.jpg',
////      'assets/sleep-position-side.jpg',
////      'assets/sleep_woman_stomach.jpg'
////    '/data/user/0/Files/Download/sleep-positions-back.jpg',
////    '/data/user/0/Files/Images/Download/sleep-position-side.jpg',
////    '/data/user/0/Files/Images/Download/sleep_woman_stomach.jpg'
//
//  ];
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    imagePageController = PageController(initialPage: 1, viewportFraction: 0.8);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//          title: Text('Smart Sleep Statistcs Page'),
//        ),
//      body: PageView.builder(
//          controller: imagePageController,
//          itemCount: images.length,
//          itemBuilder: (context,position){
//            return imageSlider(position);
//          }),
////           Text('The Sleeping Positions'),
////          Text('These are sleeping positions you had last night.'),
//    );
//  }
//
//  imageSlider(int index){
//    return AnimatedBuilder(
//      animation: imagePageController,
//      builder: (context, widget) {
//        return Center(
//          child: SizedBox(
//            height: 200,
//            width: 300,
//            child: widget,
//          ),
//        );
//      },
//      child: Container(
//        margin: EdgeInsets.all(10),
//        child: Image.network(images[index], fit: BoxFit.cover),
////        child: Image.file(File(images[index]), fit: BoxFit.cover),
//      ) ,
//    );
//  }
//}

//Version 2 - carousel package, online address
//http://www.coderzheaven.com/2019/04/22/carousel-in-flutter/
class _StatsState extends State<Stats>{
  int _current = 0;
  List images = [
//    'https://www.mybestmattress.com/storage/media/images/stomach-sleeper.o.jpg',
//    'https://i.pinimg.com/originals/ef/11/d6/ef11d67c5fc3bc349a92ef947dd6a848.jpg',
//    'https://www.sleepmaker.com.au/wp-content/uploads/2017/08/sleep-positions-back_1180x800.jpg'
    'assets/sleep-positions-back.jpg',
    'assets/sleep-position-side.jpg',
    'assets/sleep_woman_stomach.jpg'
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text('Smart Sleep Statistcs Page'),
//        bottom: TabBar(
//          tabs: <Widget>[
//            Tab(text: 'Sleep Positions',),
//            Tab(text: 'Sleep Talks',),
//          ],
//        ),
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            SleepPositions(),
          ],
        ),

      ),
    );
  }

  Widget SleepPositions(){
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Sleeping Positions',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'These are sleeping positions you had last night.\n',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            CarouselSlider(
              height: 280,
              initialPage: 1,
              onPageChanged: (index){
                setState(() {
                  _current = index;
                });
              },
              items: images.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
//                              child: Image.network(
//                                imgUrl,
//                                fit: BoxFit.fill,
//                              ),
                      child: Image.asset(
                          imgUrl
                      ),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
