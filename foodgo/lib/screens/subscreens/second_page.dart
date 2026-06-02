import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: const Center(
        child: Text("Welcome to Second Page",
        style: TextStyle(
          fontSize: 35,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        ),

      ),
    );
  }
}