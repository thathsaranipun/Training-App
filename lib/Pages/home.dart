
import 'package:check/Setup/calculator.dart';
import 'package:check/Setup/photo.dart';
import 'package:check/Setup/themeapply.dart';
import 'package:flutter/material.dart';
import '../Setup/currency.dart';
import '../Weather/ui/WeatherScreen.dart';

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
            label: 'Articles',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_sharp),
            label: 'Weather',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Calculator',
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
          child: const ArticleFinder(),
          
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: WeatherScreen(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Calculator(),
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
