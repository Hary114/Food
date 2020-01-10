import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
 
void main() => runApp(ViewFood());
 
class ViewFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Food')
          ),
        body: JsonImageList(),
      ),
    );
  }
}
 
class Flowerdata {
 String id;
 String judul;
 String description;
 String img;
 
  Flowerdata({
    this.id,
    this.judul,
    this.description,
    this.img
  });
 
  factory Flowerdata.fromJson(Map<String, dynamic> json) {
    return Flowerdata(
      id: json['id'],
      judul: json['judul'],
      description: json['description'],
      img: json['img']
 
    );
  }
}
 
class JsonImageList extends StatefulWidget {
 
  JsonImageListWidget createState() => JsonImageListWidget();
 
}
 
class JsonImageListWidget extends State {
 
  final String apiURL = 'https://api-food21.000webhostapp.com/api/getPost.php';
 
  Future<List<Flowerdata>> fetchFlowers() async {
 
    var response = await http.get(apiURL);
 
    if (response.statusCode == 200) {
 
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
 
      List<Flowerdata> listOfFruits = items.map<Flowerdata>((json) {
        return Flowerdata.fromJson(json);
      }).toList();
      print(listOfFruits);
      return listOfFruits;
      
      }
     else {
       
      throw Exception('Failed to load data from Server.');
    }
  }
 
  selectedItem(BuildContext context, String holder) {
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(holder),
        actions: <Widget>[
          FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
     },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Flowerdata>>(
        future: fetchFlowers(),
        builder: (context, snapshot) {
 
          if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
            );
 
          return ListView(
            children: snapshot.data
                .map((data) => Column(children: <Widget>[
                  GestureDetector(
                    onTap: (){selectedItem(context, data.description);},
                    child: Row(
                    children: [
                      Container(
                      width: 200, 
                      height: 100,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:
                        Image.network(data.img,
                       width: 200, height: 100, fit: BoxFit.cover,))),
                       
                       Flexible(child:
                        Text(data.judul, 
                            style: TextStyle(fontSize: 18))),
                            
                      ]),),
 
                      Divider(color: Colors.black),
 
                     ],))
                .toList(),
          );
        },
    );
  }
}