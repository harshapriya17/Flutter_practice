import 'package:flutter/material.dart';
import 'fourth_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  // CURRENT LEVEL
  int currentLevel = 0;

  // LEVEL NAMES
  List<String> levels = [
    "Start",
    "Middle",
    "End",
  ];

  // COLORS
  List<Color> colors = [
    Colors.green,
    Colors.orange,
    Colors.red,
  ];

  // INCREMENT
  void increaseLevel() {

    if (currentLevel < 2) {

      setState(() {

        currentLevel++;
      });
    }
  }

  // DECREMENT
  void decreaseLevel() {

    if (currentLevel > 0) {

      setState(() {

        currentLevel--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("Volume Controller"),

        centerTitle: true,

        backgroundColor: colors[currentLevel],
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // TITLE
            Text(

              levels[currentLevel],

              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: colors[currentLevel],
              ),
            ),

            SizedBox(height: 40),

            // NODES
            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // START NODE
                CircleAvatar(

                  radius: 18,

                  backgroundColor:
                  currentLevel >= 0
                      ? Colors.green
                      : Colors.grey,
                ),

                Container(
                  width: 60,
                  height: 5,
                  color: currentLevel >= 1
                      ? Colors.orange
                      : Colors.grey,
                ),

                // MIDDLE NODE
                CircleAvatar(

                  radius: 18,

                  backgroundColor:
                  currentLevel >= 1
                      ? Colors.orange
                      : Colors.grey,
                ),

                Container(
                  width: 60,
                  height: 5,
                  color: currentLevel >= 2
                      ? Colors.red
                      : Colors.grey,
                ),

                // END NODE
                CircleAvatar(

                  radius: 18,

                  backgroundColor:
                  currentLevel >= 2
                      ? Colors.red
                      : Colors.grey,
                ),
              ],
            ),

            SizedBox(height: 50),

            // BUTTONS
            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // DECREMENT
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: decreaseLevel,

                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),

                SizedBox(width: 30),

                // INCREMENT
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: increaseLevel,

                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
            ElevatedButton(

              style: ElevatedButton.styleFrom(

                backgroundColor: colors[currentLevel],
              ),

              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => FourthPage(),
                  ),
                );
              },

              child: Text(

                "Go Fourth Page",

                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}