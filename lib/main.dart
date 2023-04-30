import 'package:flutter/material.dart';
import 'package:ofcsis/homepage.dart';
import 'package:ofcsis/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OFCSIS',
      home: HomePage(),
    );
  }
}
