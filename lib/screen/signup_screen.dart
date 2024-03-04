import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/api_key.dart';
import '../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.3,
      height: size.height / 1.9,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTextFiled(
              txt:MyStrings.emailAddress,
              obscureText: false,
              controller: MyTextEditingController.email,
            ),
            MyTextFiled(
              txt:MyStrings.password,
              obscureText: true,
              controller: MyTextEditingController.password,
            ),
            Center(
              child: MainButton(
                onTap: () async {
                  await Auth.verifyeCode({
                    'ishtml': 'false',
                    'sendto': MyTextEditingController.email.text,
                    'name': 'Hi',
                    'replyTo': 'your mail where users can send reply',
                    'title': 'Auth',
                    'body': '${MyTextEditingController.password.text} is your password.'
                  });
                  SharedPreferencesMannager().saveString('pass',MyTextEditingController.password.text);
                  SharedPreferencesMannager().saveString('email', MyTextEditingController.email.text);
                  if (SharedPreferencesMannager().getString('email')!.isEmpty &&
                      SharedPreferencesMannager().getString('email')!.isEmpty) {
                 ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Error')));
                  } else {
                    Navigator.pushReplacementNamed(context, RouteName.homeScreen);
                  }
                },
                size: const Size(400, 800),
                bgcolor: MyColor.bgButtonColor,
                txt: MyStrings.signUp,
                txtcolor: Colors.white,
              ),
            ),
          ]),
    );
  }
}
