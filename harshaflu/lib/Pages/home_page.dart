import 'package:flutter/material.dart';

import 'second_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold (
      appBar:AppBar(
        title:Text("Hi its abilio home page "),
      ),
      body: Center(

        child: Container(

          height: 500,
          width: 300,

          decoration: BoxDecoration(

            color: Colors.blue.shade50,

            borderRadius: BorderRadius.circular(20),

          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // PROFILE IMAGE
              CircleAvatar(
                radius: 50,

                backgroundImage: NetworkImage(
                  "https://picsum.photos/200",
                ),
              ),

              SizedBox(height: 20),

              // NAME
              Text(
                "Harsha Priya",

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // EMAIL
              Text(
                "harsha@gmail.com",

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 20),

              // ICON ROW
              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Icon(Icons.favorite, color: Colors.red),

                  SizedBox(width: 10),

                  Icon(Icons.star, color: Colors.orange),

                  SizedBox(width: 10),

                  Icon(Icons.thumb_up, color: Colors.blue),

                ],
              ),

              SizedBox(height: 30),

              // BUTTON
              ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.blue,

                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),

                onPressed: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  );

                },

                child: Text(
                  "Go Second Page",

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

