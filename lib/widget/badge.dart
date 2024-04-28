import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/text_style.dart';

class MyBadge extends StatelessWidget {
 final count;

  const MyBadge({
    super.key,
    this.count
  });

  @override
  Widget build(BuildContext context) {
  
    return Visibility(
      visible: count>0,
      child: Positioned(
        right: 130,
        top: 10,
        child: Container(
          height: 22,
          width: 20,
          decoration: const BoxDecoration(
            color: MyColor.bgSplashScreenColor,
            shape: BoxShape.circle
          ),
          child: Center(child: Text(count.toString(),style: MyStyle.orangeBtnText.copyWith(fontSize: 12),)),
        ),
      ),
    );
  }
}