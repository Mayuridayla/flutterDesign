import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampleproject/pages/home_screen.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

 
// void main() {
//   runApp(MaterialApp(
//     home: login_screen(),
//   ));
// }
 
class LoginScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<LoginScreen> {
  bool _isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medplus'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'MEDPLUS',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
          
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )
                    
                                    
                    ),

                    
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.deepPurple,
                  child: Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                      child: Text('Login'),
                      onPressed:
                      // nameController.text == "" || passwordController.text == "" ? null : 
                      () {
                        print(nameController.text);
                        print(passwordController.text);
                             setState(() {
            _isLoading = true;
          });
          signIn(nameController.text, passwordController.text);
                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Colors.deepPurple,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                                      },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }



signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var jsonResponse ;
    //var response = await http.post("https://reqres.in/api/login", body: data);
    
    var response = await http.post("http://api.konnsys.com/api/v1/", body: data);
    
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        print(response.body);
     //sharedPreferences.setString("token", jsonResponse['token']);
    // print(jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
      
    }
  }

}