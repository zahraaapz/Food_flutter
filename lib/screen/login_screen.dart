import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/api_key.dart';
import '../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({super.key,required this.size});
final  TextEditingController email=TextEditingController();
 final TextEditingController password=TextEditingController();
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
         MyTextFiled(txt: 'Email address',obscureText: false,controller: email,),
       MyTextFiled(txt: 'Password',obscureText: true,controller: password,),
     
         Text('Do you forgot password?',style: MyStyle.textStyle.copyWith(color: MyColor.TextColorOrange),)

        ,Center(
          child: MainButton(
            onTap: () async {
              }
            ,
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


