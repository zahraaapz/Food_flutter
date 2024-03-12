import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn_nav.dart';

import '../widget/title_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: CustomAppBar(childs: Text(MyStrings.myProfile)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 12,top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(MyStrings.personalDetails,style: MyStyle.text,),
            
              Text(
                MyStrings.change,
                style: MyStyle.whiteBtnText,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(8),
          width: 390,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Row(
            children: [
              Image.asset('assets/image/3.png'),
              Dimens.large.width,
              Column(
                children: [
                  Text(
                    'Zahra',
                    style: MyStyle.text,
                  ),
                  Text(
                    'data',
                    style: MyStyle.caption,
                  ),
                  Text(
                    'data',
                    style: MyStyle.caption,
                  ),
                  Text(
                    'data',
                    style: MyStyle.caption,
                  ),
                ],
              )
            ],
          ),
        ),
        TiltleBox(title: MyStrings.order,),
        TiltleBox(title: MyStrings.pendingReview,),
        TiltleBox(title: MyStrings.faq,),
        TiltleBox(title: MyStrings.help,),
      ]),
      bottomNavigationBar:
          btnNav(context, title: MyStrings.update, onTap: () {}, size: size),
    );
  }
}


