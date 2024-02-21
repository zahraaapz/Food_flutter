import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
const LoginScreen({super.key,required this.size});
final Size  size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width/1.3,
      height: size.height/1.9,
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const MyTextFiled(txt: 'Email address',obscureText: false),
        const MyTextFiled(txt: 'Password',obscureText: true,),
     
         Text('Do you forgot password?',style: MyStyle.textStyle.copyWith(color: MyColor.TextColorOrange),)

        ,Center(
          child: MainButton(
            size: const Size(400, 800),
            bgcolor: MyColor.bgButtonColor,
            txt: 'Login',
            txtcolor: Colors.white,
          ),
        ),
      ]),
    );
  }
}


