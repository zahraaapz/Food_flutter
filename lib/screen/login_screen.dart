import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';

import '../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        MyTextFiled(txt: 'Password',obscureText: true,),
     
         Text('Do you forgot password?',style: MyStyle.textStyle.copyWith(color: MyColor.buttonTextColor),)

        ,Center(
          child: MainButton(
            size: const Size(400, 800),
            bgcolor: MyColor.buttonbgColor,
            txt: 'Login',
            txtcolor: Colors.white,
          ),
        ),
      ]),
    );
  }
}


