import 'package:flutter/material.dart';
import 'package:food_flutter/screen/main_screen.dart';
import 'package:food_flutter/screen/register_screen.dart';
import 'screen/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        fontFamily:'sf' 
        
      ),
    );
  }
}








