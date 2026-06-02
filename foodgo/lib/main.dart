import 'package:flutter/material.dart';
import 'package:foodgo/screens/Topic4_listview.dart';
import 'package:foodgo/screens/subscreens/second_page.dart';
import 'package:foodgo/screens/topic5_navigation.dart';
import 'package:foodgo/screens/topic6_stateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Topic6Stateful(),
    );
  }
}
