import 'package:flutter/material.dart';
import 'package:foodgo/screens/topic2_layouts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Topic2Layouts(),
    );
  }
}
