import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wechat_ui/screens/login_screen.dart';


void main() { 
  debugDefaultTargetPlatformOverride=TargetPlatform.fuchsia;
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter social ui',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen()
    );
  }
}




