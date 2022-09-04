import 'package:check/Setup/themeapply.dart';
import 'package:flutter/material.dart';
import '../Article/article.dart';
import '../WeatherCurrent/weathercurrent.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
            bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Weather',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_sharp),
            label: 'Articles',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.ac_unit_sharp),
            icon: Icon(Icons.ac_unit_sharp),
            label: 'Theme',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: WeatherCurrent(),
          
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          // child: WeatherScreen(),
          child: const ArticleFinder(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: ThemeApply(),
        ),
      ][currentPageIndex],
    );
  }
}
