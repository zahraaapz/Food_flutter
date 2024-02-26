import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/api_key.dart';
import '../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
              txt: 'Email address',
              obscureText: false,
              controller: email,
            ),
            MyTextFiled(
              txt: 'Password',
              obscureText: true,
              controller: password,
            ),
            Center(
              child: MainButton(
                onTap: () async {
                  await Auth.verifyeCode({
                    'ishtml': 'false',
                    'sendto': email.text,
                    'name': 'Hi',
                    'replyTo': 'your mail where users can send reply',
                    'title': 'Auth',
                    'body': '${password.text} is your password.'
                  });
                  SharedPreferencesMannager().saveString('pass', password.text);
                  SharedPreferencesMannager().saveString('email', email.text);
                  if (SharedPreferencesMannager().getString('email')!.isEmpty &&
                      SharedPreferencesMannager().getString('email')!.isEmpty) {
                 ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Error')));
                  } else {
                    Navigator.pushReplacementNamed(context, RouteName.mainScreen);
                  }
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
