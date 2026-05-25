import 'package:flutter/material.dart';
import 'stateful.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key, required this.title});

  final String title;

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int number = 0;
  String message = "Value is 0";

  void increaseValue() {
    setState(() {
      number++;
      message = "The value increased to $number";
    });
  }

  void decreaseValue() {
    setState(() {
      number--;
      message = "The value decreased to $number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Go to First Screen',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const FirstScreen()
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 220,
                  child: Row(
                    children: [
                      // LEFT SIDE
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue.shade50,
                          padding: const EdgeInsets.all(20),
                          child: const Center(
                            child: Text(
                              "Welcome to ABILIO IT SOLUTIONS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // RIGHT SIDE
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$number",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.remove, size: 30),
                                      onPressed: decreaseValue,
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.add, size: 30),
                                      onPressed: increaseValue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
