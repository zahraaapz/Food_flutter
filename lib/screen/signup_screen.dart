import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {

const SignUpScreen({super.key,required this.size});
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
        const MyTextFiled(txt: 'Password',obscureText: true,)
     

        ,Center(
          child: MainButton(
            onTap: (){
  
            },
            size: const Size(400, 800),
            bgcolor: MyColor.bgButtonColor,
            txt: 'Sign up',
            txtcolor: Colors.white,
          ),
        ),
      ]),
    );
  }
}


