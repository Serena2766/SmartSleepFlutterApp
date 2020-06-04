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
  int currentTab = 0;

  MyHomePage home;
  Stats statistics;
  Discovery discovery;
  Settings settings;
  List<Widget> pages;
  Widget currentPage;
  Map<int, Color> color =
  {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  void initState() {
    MyHomePage home = new MyHomePage();
    Stats statistics = new Stats();
    Discovery discovery = new Discovery();
    Settings settings = new Settings();
    pages = [home, statistics, discovery, settings];
    currentPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF0277bd, color);
    return MaterialApp(
      title: 'Smart Sleep',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: Container(
        child: Scaffold(
          body: currentPage,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentTab,
            onTap: (int index) {
              setState(() {
                currentTab = index;
                currentPage = pages[index];
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                  ),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                title: Text("Statistics",
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                  ),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over),
                title: Text("Discovery",
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                  ),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings",
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                  ),),
              ),
            ],
          ),
        ),
      ),
//        title: 'Smart Sleep Home Page'),
    );
  }
}

