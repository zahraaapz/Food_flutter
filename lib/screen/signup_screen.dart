import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';

import '../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 390,
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        MyTextFiled(txt: 'Email address',),
        MyTextFiled(txt: 'Password',)
     

        ,Center(
          child: MainButton(
            size: const Size(400, 800),
            bgcolor: MyColor.buttonbgColor,
            txt: 'Sign up',
            txtcolor: Colors.white,
          ),
        ),
      ]),
    );
  }
}

