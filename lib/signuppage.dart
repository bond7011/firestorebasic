import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './services/usermanagement.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = '', pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: "Enter Email"),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  }),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                  decoration: InputDecoration(hintText: "Enter Password"),
                  onChanged: (value) {
                    setState(() {
                      pass = value;
                    });
                  }),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text("Sign Up"),
                elevation: 7.0,
                color: Colors.purple,
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: pass)
                      .then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
