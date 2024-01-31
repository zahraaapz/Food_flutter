import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/color.dart';
import 'package:food_flutter/widget/logo_splash.dart';

import 'widget/main_button.dart';
import 'widget/stack_splash.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyColor.backgroundColor,
      appBar: AppBar(
        backgroundColor:MyColor.backgroundColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(systemNavigationBarColor: MyColor.backgroundColor,statusBarColor: Colors.transparent),
      ),
      body: const Column(
   
        children: [
          LogoInSplash(),
          SizedBox(height: 400,
            child: StackInSplash(),
          ),
          
          MainButton()
        ],
      ),
    );
  }
}