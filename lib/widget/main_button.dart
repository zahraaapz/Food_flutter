import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/text_style.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    this.size,
    this.txt,
    this.bgcolor = Colors.white,
    this.txtcolor = MyColor.TextColorOrange,
    this.onTap,
  });
 final Size? size;
 final Function()? onTap;
 final String? txt;
final  bgcolor ;
final txtcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size!.height / 12,
        width: size!.width / 1.4,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(bgcolor),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: onTap,
            child: Text(
              txt!,
              style: MyStyle.orangeBtnText.copyWith(color: txtcolor),
            )));
  }
}
