import 'package:descovir/pages/auth/auth_page.dart';
import 'package:descovir/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String status = "inceleniyor";
  bool islogin;
  @override
  void initState() {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() {
        islogin = false;
      });
    } else {
      setState(() {
        islogin = true;
      });
    }
    
    FirebaseAuth.instance.authStateChanges().listen((event) {
     if (event == null) {
      setState(() {
        islogin = false;
      });
    } else {
      setState(() {
        islogin = true;
      });
    }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return islogin ? HomePage() : AuthPage();
  }
}
