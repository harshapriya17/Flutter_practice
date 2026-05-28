import 'package:flutter/material.dart';

import 'third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("Second Page"),

        centerTitle: true,

        backgroundColor: Colors.transparent,

      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.transparent,

        onPressed: () {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) => ThirdPage(),
            ),
          );

        },

        child: Icon(Icons.arrow_forward),
      ),

      // BODY
      body: ListView(

        padding: EdgeInsets.all(15),

        children: [

          // CARD 1
          Card(

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),

              title: Text("Harsha Priya"),

              subtitle: Text("Flutter Developer"),

              trailing: Icon(Icons.arrow_forward_ios),

            ),
          ),

          SizedBox(height: 15),

          // CARD 2
          Card(

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),

              title: Text("Shopping App"),

              subtitle: Text("Amazon UI Practice"),

              trailing: Icon(Icons.star),

            ),
          ),

          SizedBox(height: 15),

          // CARD 3
          Card(

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.favorite, color: Colors.white),
              ),

              title: Text("Favorite"),

              subtitle: Text("Liked Items"),

              trailing: Icon(Icons.favorite),

            ),
          ),

        ],
      ),
    );
  }
}