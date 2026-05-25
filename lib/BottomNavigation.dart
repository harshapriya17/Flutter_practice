import 'package:flutter/material.dart';
import 'package:flutter_projects/main.dart';

class MyStatefulWidget extends StatefulWidget
{
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

// Index to keep track of the selected tab
int _selectedIndex = 0;

// TextStyle for the text displayed in each tab
static const TextStyle optionStyle =
TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

// List of widgets to display in each tab
static const List<Widget> _widgetOptions = <Widget>[
Text(
'HOME PAGE OF ABILIO',
style: optionStyle,
),
Text(
'EMPLOYEE PAGE',
style: optionStyle,
),
Text(
'CONTACT INFO',
style: optionStyle,
),
];

// Method to handle tab selection
void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text(
'ABILIO IT SOLUTIONS',
style: TextStyle(
color: Colors.black,
),
),
backgroundColor: Colors.orangeAccent,
),
body: Center(
child: _widgetOptions.elementAt(_selectedIndex),
),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: 'Employee',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.contact_mail),
        label: 'Msg info',
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.brown[800],
    onTap: _onItemTapped,
  ),
);
}
}