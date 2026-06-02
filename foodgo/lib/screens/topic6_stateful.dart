import 'package:flutter/material.dart';

class Topic6Stateful extends StatefulWidget{
  const Topic6Stateful ({super.key});

  @override
  State<Topic6Stateful> createState() => _Topic6StatefulState();
}
class _Topic6StatefulState extends State<Topic6Stateful>{
  int count=0;
  Color myColor = Colors.red;
  void updateColor(){
    if(count >=10){
      myColor =Colors.blue;
    }
    else if (count >=5){
      myColor=Colors.green;
    }
    else{
      myColor=Colors.red;
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic counter"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: myColor,
                borderRadius: BorderRadius.circular(20),
              ),
            child: Center(
              child: Text("$count",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ),
            ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      count++;
                      updateColor();
                    });
            },
        child: const Text ("increase"),
                  ),
           const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      count--;
                      updateColor();
                    });
                  },
                  child: const Text("decrease"),
                ),
                ],
            ),
      const SizedBox(width: 20),
      ElevatedButton(
        onPressed: (){
          setState(() {
            count=0;
            updateColor();
          });
        },
        child: const Text("reset"),
      ),
        ],
        ),
      ),
            );
  }
}