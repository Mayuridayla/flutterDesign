import 'package:flutter/material.dart';

class PromotionPage extends StatefulWidget {
  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage
> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
     // body: Column(            

      body: ListView(
children : <Widget> [
  Image.asset(            
   'images/health.jpg',            
   width: 600,            
   height: 240,            
  fit: BoxFit.cover,            
                   )
     // child: new Text('Promotion'),
     
], 
 ),

    //  ),
        );
    
  }
}
