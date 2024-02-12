import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/widget/logo_splash.dart';

import '../widget/main_button.dart';
import '../widget/stack_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor:MyColor.bgSplashScreenColor,
      appBar: AppBar(
        backgroundColor:MyColor.bgSplashScreenColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(systemNavigationBarColor: MyColor.bgSplashScreenColor,statusBarColor: Colors.transparent),
      ),
      body: Column(
   
        children: [
          LogoInSplash(size:size),
          SizedBox(height: size.height/2,
            child: StackInSplash(size:size),
          ),
          
          MainButton(size:size,
          txtcolor:MyColor.bgButtonColor ,
          txt: 'Login',
          bgcolor:Colors.white ,)
        ],
      ),
    );
  }
}