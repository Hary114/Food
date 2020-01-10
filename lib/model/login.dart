import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food2/model/HomePage.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus {
  hasNotLogin,
  login
}

class _LoginState extends State<Login> {
  bool visible = true;
  String username, password;
  LoginStatus _loginStatus = LoginStatus.hasNotLogin;

  fieldVisible() {
    setState(() {
      visible = !visible;
    });
  }

  final _key = new GlobalKey<FormState>();

  checkForm() {
    final form = _key.currentState;
    if(form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post('https://api-food21.000webhostapp.com/api/login.php', body: {
      "username": username,
      "password": password
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String msg = data['message'];
    if(value==1) {
      setState(() {
        _loginStatus = LoginStatus.login;
      });
      print(msg);
    } else {
      print(msg);
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    switch(_loginStatus) {
      case LoginStatus.hasNotLogin:
        return Scaffold(
          body: Form(
            key: _key,
            child: Container(
              decoration: BoxDecoration(
              ),
              child: ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection(),
                  
                ],
              ),
            )
          )
        );
      break;
      case LoginStatus.login:
        return HomePage();
      break;
    }
  }
   Container headerSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Text('Peach', style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,),
      );
    }

Container textSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            inputUsername('Username', Icons.person),
            SizedBox(height: 30,),
            inputPassword('Password', Icons.lock)
          ],
        ),
      );
    }



    TextFormField inputUsername(String title, IconData icon) {
      return TextFormField(
        validator: (field) {
          if(field.isEmpty) {
            return "Please insert a username";
          }
        },
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.black),
          icon: Icon(icon),
        ),
        onSaved: (field)=> username = field,
      );
    }

    TextFormField inputPassword(String title, IconData icon) {
      return TextFormField(
        validator: (field) {
          if(field.isEmpty) {
            return "Please insert a password";
          }
        },
        onSaved: (field) => password = field,
        obscureText: visible,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.black),
          icon: Icon(icon),
          suffixIcon: IconButton(
            onPressed: fieldVisible,
            icon: Icon(
              visible ? Icons.visibility_off : Icons.visibility
            ),
          )
        ),
      );
    }

    Container buttonSection() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: RaisedButton(
                onPressed: () {
                  checkForm();
                },
                elevation: 0,
                child: Text('Login', style: TextStyle(
                  color: Colors.blue),
                  ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
          );
      }
}