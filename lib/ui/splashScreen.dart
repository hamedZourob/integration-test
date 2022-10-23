import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intergrationtest/ui/registerScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent,Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child:  Center(
          child: Icon(Icons.camera,size: 50, color: Colors.white,),
        ),
    );
  }
  @override
  void initState() {
    //انشاء مؤقت تاخير لمدة3ثواني
    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
    });
  }
}
