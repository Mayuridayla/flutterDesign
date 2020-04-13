import 'package:flutter/material.dart';
import 'package:sampleproject/pages/CustomGestureDetector.dart';
import 'package:sampleproject/pages/account_screen.dart';
import 'package:sampleproject/pages/healthylife_screen.dart';
import 'package:sampleproject/pages/home_screen.dart';
import 'package:sampleproject/pages/intro_screen.dart';
import 'package:sampleproject/pages/login_screen.dart';
import 'package:sampleproject/pages/menu_screen.dart';
import 'package:sampleproject/pages/promotion_screen.dart';
import 'package:sampleproject/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
 "/account": (BuildContext context) => AccountScreen(),
"/promotion": (BuildContext context) => PromotionPage(),
"/heathlife": (BuildContext context) => HedalthLife(),
"/menu": (BuildContext context) => MenuPage(),

"/custom_gesture": (BuildContext context) => CustomGestureDetector(axis: null, child: null, velocity: null,),


}
;

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.deepPurple, accentColor: Colors.purpleAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
