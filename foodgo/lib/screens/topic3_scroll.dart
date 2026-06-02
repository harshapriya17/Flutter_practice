import 'package:flutter/material.dart';

class Topic3Scroll extends StatelessWidget{
  const Topic3Scroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(("Scroll View")
        ),
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                color: Colors.purple
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                color: Colors.green,
              ),
              SizedBox(height: 20),

              Container(
                height: 150,
                color: Colors.black38,
              ),
            ],
          ),
      ),
    );
  }
}