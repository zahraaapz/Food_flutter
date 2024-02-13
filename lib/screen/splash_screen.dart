import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/component/api.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/model/list.dart';
import 'package:food_flutter/service/service.dart';
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
  void initState() async{
    // TODO: implement initState
    super.initState();
    await Service().getMealList(ApiUrl().chicken, chickenList);
    await Service().getMealList(ApiUrl().pasta, pastaList);
    await Service().getMealList(ApiUrl().pork, porkList);
    await Service().getMealList(ApiUrl().vegan, veganList);
    await Service().getMealList(ApiUrl().starter, starterList);
    await Service().getMealList(ApiUrl().side, sideList);
    await Service().getMealList(ApiUrl().dessert, dessertList);

    await Service().getDrinkList(ApiUrl().cocoa, cocoaList);
    await Service().getDrinkList(ApiUrl().shake, shakeList);
    await Service().getDrinkList(ApiUrl().cocktail, cocktailList);
   
  }
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