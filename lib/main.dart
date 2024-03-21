import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import 'package:food_flutter/route/route.dart';
import 'package:food_flutter/screen/home/home_screen.dart';
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
      theme: ThemeData(fontFamily: 'sf'),
      home:HomeScreen()
      // routes: route,
    );
  }
}

IHomeRepo iHomeRepo = HomeRepository(HomeRemoteDataSrc(Dio()));
