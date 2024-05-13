import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/component/api_key.dart';
import 'package:food_flutter/screen/home/extrct_home.dart';
import 'package:food_flutter/screen/profile/profile_screen.dart';
import '../../component/color.dart';
import '../../component/text_style.dart';
import '../../widget/badge.dart';
import '../../widget/custom_paint.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;

  int selectBtmNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: MyColor.bgColor,
      body:Stack(
        children: [
          Positioned(
             bottom: 60,
                right: 0,
                left: 0,
                top: 0,
            child: IndexedStack(
              index: selectBtmNav,
              children: [
                ExtrctHome(select: select),
             
                const ProfileScreen(),

                const CartScreen(),
                 const CartScreen(),
              ],
            ),
          ),
          Positioned(
           
            bottom: 0,
            right: 0,
            left: 0,
            child: nav()),
  ],
      ),
    );
  }

AnimatedContainer nav(){
  return AnimatedContainer(

    duration: const Duration(microseconds: 50),
  decoration: BoxDecoration(
    color: Colors.white,
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(selectBtmNav==0?0.0:20),
  topRight: Radius.circular(selectBtmNav==icons.length-1?0.0:20)
)
  ),
  child: Row(
    mainAxisAlignment:MainAxisAlignment.spaceAround,
    children: [
      for(int i=0;i<icons.length;i++)
      GestureDetector(
        onTap: () {
           setState(()=>selectBtmNav=i);
          
           },
        child: SizedBox(child:iconsBtn(i),width:100 ,),
      )
    ],
  ),);
}

iconsBtn(int i){

  bool  activeBtn=selectBtmNav==i?true:false;
  var height=activeBtn?60.0:0.0;
  var width=activeBtn?50.0:0.0;

  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
    width: 75,
    height: 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(duration: const Duration(microseconds: 50),
            width: width,
            height: height,
            child: activeBtn?
            CustomPaint(
              painter: BtnNotch(),
            ):const SizedBox(),),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(icons[i],
            color: activeBtn? MyColor.bgSplashScreenColor: MyColor.iconColor  ,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(name[i],
            style: activeBtn? MyStyle.caption.copyWith(color:MyColor.bgSplashScreenColor): MyStyle.caption,),
          ),
          if(i==2)
           ValueListenableBuilder(
                 valueListenable:cartCount ,
                builder: (context,value,child) {
                return MyBadge(count:value);
                  },
                )
        ],
      ),
    ),
  );
}
}
