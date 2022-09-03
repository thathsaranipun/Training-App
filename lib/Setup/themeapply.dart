import 'package:check/main.dart';
import 'package:flutter/material.dart';

class ThemeApply extends StatefulWidget {
  @override
  _ThemeApplyState createState() => _ThemeApplyState();

  static _ThemeApplyState of(BuildContext context) =>
      context.findAncestorStateOfType<_ThemeApplyState>()!;
}

class _ThemeApplyState extends State<ThemeApply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Change"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your theme:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light, 
                  child: MyApp.themeNotifier.value == ThemeMode.light
                      ? Text('Dark theme')
                      : Text('Light theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
