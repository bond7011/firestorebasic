import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', pass = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
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
                },
                obscureText: true,
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text("login"),
                color: Colors.blue,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email, password: pass)
                      .then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              RaisedButton(
                child: Text("Sign Up"),
                elevation: 7.0,
                color: Colors.purple,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
