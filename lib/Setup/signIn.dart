import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
            TextFormField(
              validator:(input){
                if(input!.isEmpty){
                  return 'Please type an email';
                }
              } ,
              onSaved:(input) => _email =input!,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
          
            TextFormField(
              validator:(input){
                if(input!.length<6){
                  return 'Please type a password';
                }
              } ,
              onSaved:(input) => _password =input!,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Sign In'), 
            )
          ]),
          ),
      )
    );
  }
  void signIn() async {  
    final formState =_formKey.currentState;
    if(formState!.validate()){
      formState.save();
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password:_password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

