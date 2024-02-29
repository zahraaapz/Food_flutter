import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.size});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
            Text(
              'Do you forgot password?',
              style: MyStyle.whiteBtnText,
            ),
            Center(
              child: MainButton(
                onTap: () {
                  if (
                    SharedPreferencesMannager().getString('email') ==
                          email.text &&
                      SharedPreferencesMannager().getString('pass') ==
                          password.text) {
                            Navigator.pushReplacementNamed(context,RouteName.homeScreen);
                            
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
                  }
                },
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
