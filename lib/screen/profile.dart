import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn_nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: CustomAppBar(childs: Text(MyStrings.myProfile)),
      body: Column(children: [
        Row(
          children: [
            Text(MyStrings.personalDetails),
            Text(
              MyStrings.change,
              style: MyStyle.whiteBtnText,
            ),
          ],
        ),
        Container(
          width: 390,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Row(
            children: [
              Image.asset('assets/image/3.png'),
              Column(
                children: [
                  Text(
                    'data',
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
        Container(
          width: 390,
                    decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('data'),
                IconButton(onPressed: (){}, icon:Icon(CupertinoIcons.forward))
              ],),
        )
      ]),
         bottomNavigationBar: btnNav(context,title:MyStrings.update ,onTap: (){},size: size), );
  }

}
