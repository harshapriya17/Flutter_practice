import 'package:flutter/material.dart';

// PAGE 1: Stateless Widget
class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateless Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // REDIRECT to the Stateful Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StatefulPage()),
            );
          },
          child: const Text("Go to Stateful Page"),
        ),
      ),
    );
  }
}

// PAGE 2: Stateful Widget
class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  String _message = "Hello! I am Stateful";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Page"), backgroundColor: Colors.amber),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = "UI State Changed!";
                });
              },
              child: const Text("Change Message"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
