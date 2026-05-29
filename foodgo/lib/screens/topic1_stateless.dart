import 'package:flutter/material.dart';

class Topic1Stateless extends StatelessWidget{
  const Topic1Stateless ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("topic 1"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            const Icon(Icons.beach_access,
            size: 80,
            ),
            const SizedBox(height: 20),

            const Text(
              "welcome to Flutter",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(" starting once again the topic in widget",
                style:TextStyle(
                  color: Colors.white24,
                  fontSize: 20,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}