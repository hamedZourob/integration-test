import 'package:flutter/material.dart';
import 'package:intergrationtest/ui/loginScreen.dart';
import 'package:intergrationtest/ui/registerScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterScreen(),
    );
  }
}