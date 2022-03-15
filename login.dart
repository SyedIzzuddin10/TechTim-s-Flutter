// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, prefer_const_constructors_in_immutables, unnecessary_new, avoid_unnecessary_containers, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/myHomePage.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late User user;
  late String userName;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
    });
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user!,
          userName = user.displayName!,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(userName)))
          // builder: (context) => MyHomePage(user.displayName)))
        });
  }

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: this.click,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 35.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.grey, fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
