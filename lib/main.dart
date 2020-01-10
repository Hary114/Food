import 'package:flutter/material.dart';
import 'package:food2/model/detail.dart';
import 'package:splashscreen/splashscreen.dart';
import './model/HomePage.dart';
import 'package:food2/model/mainPage.dart';
import 'package:food2/model/login.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Food And Beverage',
    theme: ThemeData(
      primaryColor: Colors.white,
      fontFamily: 'Jomolhari'
    ),
    initialRoute: '/',
    routes: {
      '/' : (context) => MyApp(),
      MainPage.routeName : (context) => MainPage(),
      HomePage.routeName : (context) => HomePage(),
      Detail.routeName : (context) => Detail(),
      Login.routeName : (context) => Login(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}
class MyAppState extends State<MyApp> {
  String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MainPage(),
      title: new Text(this.title,    
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.greenAccent
        ),
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: Colors.greenAccent,
    );
  }
}