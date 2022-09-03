import 'package:check/Setup/signIn.dart';
import 'package:check/Setup/signUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(140, 340, 0, 60),
          child: Column(children: [
            ElevatedButton(
            onPressed: navigateToSignIn,
            child: Text('Click to SignIn'),
            ),
            ElevatedButton(
            onPressed: navigateToSignUp,
            child: Text('Click to SignUp'),
            ),
          ]),
        ));
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}