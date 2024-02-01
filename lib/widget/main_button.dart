import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';

class MainButton extends StatelessWidget {
 MainButton({
    super.key,
    this.size,
    this.txt,
    this.bgcolor,
    this.txtcolor,

  });
Size? size;
String? txt;
Color? bgcolor=Colors.white;
Color? txtcolor= MyColor.buttonTextColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:size!.height/12,
        width:size!.width/1.4,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:  MaterialStatePropertyAll(bgcolor),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: () {},
            child: Text(txt!,style: MyStyle.textStyle.copyWith(color:txtcolor),)));
  }
}