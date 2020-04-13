import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sampleproject/pages/CustomGestureDetector.dart';


class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => new _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{

  bool showBottomMenu = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _emailError = false, _passError = false, _loading = false;
  bool isDealer = true;

  @override
  Widget build(BuildContext context) {
    ThemeData _currentTheme = Theme.of(context);

    double height= MediaQuery.of(context).size.height;

    double threshold = 100;

       return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomGestureDetector(
          
          axis: CustomGestureDetector.AXIS_Y,
          velocity: threshold,
          onSwipeUp: (){
            this.setState((){
              showBottomMenu = true;
            });
          },
          onSwipeDown: (){
            this.setState((){
              showBottomMenu = false;
            });
          },
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[                
                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: (showBottomMenu)?1.0:0.0,
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),

                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),),
                ),

                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 200),
                  left: 0,
                    bottom: (showBottomMenu)?-60:-(height/3),
                    child: MenuWidget())

              ],
            ),
          ),
        ),
      ),
    );
  }

}

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        color: Colors.deepPurple,
        width: width,
        height: height/3 + 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
          child: Column(
            children: <Widget>[

              Icon(
                Icons.keyboard_arrow_up,
                size: 20,
                color: Colors.white,
                
              ),

new CircleAvatar(
    backgroundColor: Colors.white,
    child: new Text('M',
    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              
    ),

  ),


              Text(
             //   "Social Logins",
               "Mayuri Dayla",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
              //  "Choose whichever you use frequently!",
                "mayuridayla@gmail.com",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),

// ListTile(
//         title: Text('Home'),
//         trailing: new Icon(Icons.home),
//         onTap: () {
//           // Update the state of the app.
//         Navigator.pop(context);
//         },
//       ),


              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                //  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                //    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
              //    color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                   // Navigator.pop(context);

                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                //  color: Colors.lightBlue.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Request Product",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.receipt,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                 //   Navigator.pop(context);
                  },
                ),
              ),
SizedBox(
                width: double.infinity,
                child: MaterialButton(
              //    color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                   // Navigator.pop(context);

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
