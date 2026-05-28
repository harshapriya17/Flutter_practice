import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {

  double musicValue = 30;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        title: Text("Music Player"),

        centerTitle: true,

        backgroundColor: Colors.black,
      ),

      body: Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // MUSIC IMAGE
            CircleAvatar(

              radius: 100,

              backgroundImage: NetworkImage(
                "https://picsum.photos/300",
              ),
            ),

            SizedBox(height: 30),

            // SONG NAME
            Text(

              "Flutter Beats",

              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // ARTIST
            Text(

              "Harsha Music",

              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 40),

            // PROGRESS BAR
            LinearProgressIndicator(

              value: musicValue / 100,

              color: Colors.green,

              backgroundColor: Colors.grey.shade800,
            ),

            SizedBox(height: 20),

            // SLIDER
            Slider(

              value: musicValue,

              min: 0,
              max: 100,

              activeColor: Colors.green,

              onChanged: (value) {

                setState(() {

                  musicValue = value;
                });
              },
            ),

            SizedBox(height: 30),

            // MUSIC BUTTONS
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                // PREVIOUS
                IconButton(

                  onPressed: () {},

                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                // PLAY PAUSE
                CircleAvatar(

                  radius: 35,

                  backgroundColor: Colors.green,

                  child: IconButton(

                    onPressed: () {

                      setState(() {

                        isPlaying = !isPlaying;
                      });
                    },

                    icon: Icon(

                      isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,

                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),

                // NEXT
                IconButton(

                  onPressed: () {},

                  icon: Icon(
                    Icons.skip_next,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

              ],
            ),

            SizedBox(height: 40),

            // GO BACK BUTTON
            ElevatedButton(

              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.green,
              ),

              onPressed: () {

                Navigator.pop(context);
              },

              child: Text(

                "Go Back",

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