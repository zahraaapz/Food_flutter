import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn.dart';
import 'package:food_flutter/widget/prof_box.dart';
import '../../widget/title_box.dart';

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
          padding: const EdgeInsets.only(left: 13, right: 12, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.personalDetails,
                style: MyStyle.text,
              ),
              Text(
                MyStrings.change,
                style: MyStyle.whiteBtnText,
              ),
            ],
          ),
        ),
        ProfBox(),
        TiltleBox(title: MyStrings.order),
        TiltleBox(title: MyStrings.pendingReview),
        TiltleBox(title: MyStrings.faq),
        TiltleBox(title: MyStrings.help),
      ]),
      bottomNavigationBar:
          btn(context, title: MyStrings.update, onTap: () {}, size: size),
    );
  }
}
