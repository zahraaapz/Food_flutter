  import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/widget/main_button.dart';

Padding btn(BuildContext context,{onTap,title,size}) {
    return Padding(
      padding: const EdgeInsets.only(left:50.0,right:50,bottom: 8),
      child: MainButton(
        onTap: onTap,
        size: size,
        txtcolor: Colors.white,
        txt:title,
        bgcolor: MyColor.bgButtonColor,
      ),
    );
  }