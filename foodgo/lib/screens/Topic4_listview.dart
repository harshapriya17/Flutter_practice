import 'package:flutter/material.dart';

class FoodList extends StatelessWidget{
 const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food List"),
      ),
      body: ListView.builder(
        itemCount:10,
        itemBuilder:(context,index){
          return Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius:BorderRadius.circular(20),
            ),
            child: Center(
              child: Text("Food Item ${index+1}",
                  style: const TextStyle(
                  fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          );
        }
      ),
    );
  }
}