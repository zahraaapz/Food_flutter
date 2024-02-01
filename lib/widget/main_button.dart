import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';

class MainButton extends StatelessWidget {
 MainButton({
    super.key,
    this.size
  });
Size? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:size!.height/12,
        width:size!.width/1.4,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: () {},
            child: Text('Get Started',style: MyStyle.textStyle.copyWith(color: MyColor.buttonText),)));
  }
}