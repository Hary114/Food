import 'package:flutter/material.dart';
import 'package:food2/Model/HomePage.dart';
import 'package:food2/model/ViewFood.dart';
import 'package:food2/model/login.dart';



class MainPage extends StatefulWidget {

  static const routeName = '/MainPage';

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List<Widget> _layoutPage = [
    HomePage(),
    ViewFood(),
    Login(),
  
  ];

  void _onItemTapped(int index) {
    setState(() {
     selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _layoutPage.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('List '),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
