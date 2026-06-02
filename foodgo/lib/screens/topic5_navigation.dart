import 'package:flutter/material.dart';
import 'subscreens/second_page.dart';

class Topic5Navigation extends StatelessWidget{
  const Topic5Navigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation",
          style: TextStyle(
            color:Colors.red,
            fontSize:50,
            fontWeight:FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> SecondPage(),
            ),
        );
        },
          child: const Text("Go to Second Page",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color:Colors.brown,
              fontWeight:FontWeight.bold,
            ),
          ),
      ),
      ),
    );
  }
}