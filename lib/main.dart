import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/route/route.dart';
import 'package:food_flutter/screen/home_screen.dart';
import 'screen/splash_screen.dart';
import 'utils/sharedPre_mng.dart';

void main() async {
  runApp(const MyApp());
  await SharedPreferencesMannager().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(fontFamily: 'sf'),
    );
  }
}
