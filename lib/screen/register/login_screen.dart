import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.3,
      height: size.height / 2,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTextFiled(
              txt: MyStrings.emailAddress,
              obscureText: false,
              controller: MyTextEditingController.email,
            ),
            MyTextFiled(
              txt: MyStrings.password,
              obscureText: true,
              controller: MyTextEditingController.password,
            ),
            Text(
              MyStrings.forgotPassword,
              style: MyStyle.whiteBtnText,
            ),
            Center(
              child: MainButton(
                onTap: () {
                  if (
                    SharedPreferencesMannager().getString('email') ==
                          MyTextEditingController.email.text &&
                      SharedPreferencesMannager().getString('pass') ==
                          MyTextEditingController.password.text) {
                            Navigator.pushReplacementNamed(context,RouteName.homeScreen);
                            
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                  }
                },
                size: const Size(400, 800),
                bgcolor: MyColor.bgButtonColor,
                txt:MyStrings.login,
                txtcolor: Colors.white,
              ),
            ),
          ]),
    );
  }
}
