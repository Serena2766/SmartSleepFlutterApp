import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../player_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_plugin_record/flutter_plugin_record.dart';
//class Discovery extends StatefulWidget {
//
//  @override
//  _DiscoveryState createState() => _DiscoveryState();
//}
//
//class _DiscoveryState extends State<Discovery> {
//  FlutterPluginRecord recordPlugin;
//
//  @override
//  void initState() {
//    FlutterPluginRecord   recordPlugin = new FlutterPluginRecord();
//    recordPlugin.init();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Smart Sleep Discovery Page'),
//      ),
//      body: Row(
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.fiber_manual_record),
//              iconSize: 30.0,
//              tooltip: 'Start recording',
//              color: Colors.blue,
//              onPressed: () {
//                setState(() {
//                  recordPlugin.start();
//                  print("Start recording");
//                });
//              },
//            ),
//            IconButton(
//              icon: Icon(Icons.stop),
//              iconSize: 30.0,
//              tooltip: 'Stop recording',
//              color: Colors.blue,
//              onPressed: () {
//                setState(() {
//                  recordPlugin.stop();
//                  print("Stop recording");
//                });
//              },
//            ),
//            IconButton(
//              icon: Icon(Icons.play_arrow),
//              iconSize: 30.0,
//              tooltip: 'Play recording',
//              color: Colors.blue,
//              onPressed: () {
//                setState(() {
//                  recordPlugin.play();
//                  print("Play recording");
//                });
//              },
//            ),
//          ]
//      ),
//    );
//  }
//}

class Discovery extends StatefulWidget {

  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  List images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Community'),
                Tab(text: 'Shopping'),
              ],
            ),
            title: Text('Smart Sleep Discovery Page',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
              ),),
          ),
          body: TabBarView(
            children: [
              Community(),
              Shopping(),
            ],
          ),
        ),
      ),
    );
  }

  Widget Community() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/community.PNG'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget Shopping() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg8.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: new StaggeredGridView.count(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: <Widget>[
          new _Tile(
              'assets/sheet.jpg',
              1),
          new _Tile(
              'assets/sheet2.jpg',
              2),
          new _Tile(
              'assets/01.jpg',
              3),
          new _Tile(
              'assets/04.jpg',
              4),
          new _Tile(
              'assets/02.jpg',
              5),
          new _Tile(
              'assets/03.jpg',
              6),
          new _Tile(
              'assets/00.jpg',
              7),
          new _Tile(
              'assets/05.jpg',
              8),
        ],
        staggeredTiles: const <StaggeredTile>[
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.source, this.index);
  final String source;
  final int index;
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image.asset(source),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Bed sheets $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  'Price: 30 dollars',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}