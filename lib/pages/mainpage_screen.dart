import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
final String url = "http://dummy.restapiexample.com/api/v1/employees";
List data;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
   }

Future<String> getJsonData() async{
    var response = await http.get(
        Uri.encodeFull(url),
      headers: {"Accept": "application/json"}

    );

    print(response.body);

    setState(() {
      var toJsonData = json.decode(response.body);
     data = toJsonData['data'];
    //  data = toJsonData['results'];
    
    });

    return "Success";
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      
// This body is for Get JSon
        body: new ListView.builder(
             // padding: Size(10.0, 10.0),
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  child: new Center(
                      child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                      child: new Container(
                    child: new Text(data[index]['employee_name']),
                    padding: const EdgeInsets.all(20),
                  ))
                ],
              )));
            }),
        );
    
  }
}