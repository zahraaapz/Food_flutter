import 'package:flutter/material.dart';
import 'package:food_flutter/color.dart';
import 'package:food_flutter/style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: 314,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: () {},
            child: Text('Get Started',style: MyStyle.textStyle.copyWith(color: MyColor.buttonText),)));
  }
}