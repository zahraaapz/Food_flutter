import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/screen/register/login_screen.dart';
import 'package:food_flutter/screen/register/signup_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double marginLeft = 10.0;
  int select = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColor.bgColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  height: size.height / 2.3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (Dimens.large * 5).height,
                      Center(child: Image.asset('assets/image/3.png')),
                      (Dimens.large * 2).height,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    marginLeft = 0;
                                    select = 0;
                                  });
                                },
                                child: SizedBox(
                                  width: 140,
                                  height: 60,
                                  child: Text(MyStrings.login,
                                      style: MyStyle.text,textAlign: TextAlign.center,),
                                )),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    marginLeft = 160;
                                    select = 1;
                                  });
                                },
                                child: SizedBox(
                                  
                                  width: 140,
                                  height:60,
                                  child: Text(
                                  
                                    MyStrings.signUp,
                                    textAlign: TextAlign.center,
                                    style: MyStyle.text,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                          margin: EdgeInsets.only(
                            left: marginLeft + 50,
                          ),
                          duration: const Duration(milliseconds: 200),
                          width: 143,
                          height: 3,
                          color: MyColor.TextColorOrange)
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: IndexedStack(
                  index: select,
                  children: [
                    LoginScreen(size: size),
                  SignUpScreen(size: size,)]),
            ),
          ],
        ),
      ),
    );
  }
}
