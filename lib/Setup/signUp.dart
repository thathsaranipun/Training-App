import 'package:check/Setup/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input!.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                onSaved: (input) => _email = input!,
              ),
              TextFormField(
                validator: (input) {
                  if(input!.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                onSaved: (input) => _password = input!,
                obscureText: true,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),
            ],
          )
        ),
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password: _password);
         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}