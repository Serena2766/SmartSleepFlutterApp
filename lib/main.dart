import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/discovery.dart';
import 'pages/stats.dart';
import 'pages/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    MyHomePage(),
    Stats(),
    Discovery(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Sleep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Smart Sleep Home Page'),
//        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text("Statistics"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over),
              title: Text("Discovery"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),

      ),
//        title: 'Smart Sleep Home Page'),
    );
  }
}

