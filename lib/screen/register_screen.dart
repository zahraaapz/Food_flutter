import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/screen/login_screen.dart';
import 'package:food_flutter/screen/signup_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double marginLeft = 10.0;
  int select=0;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.bgRegisterScreenColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    width: double.infinity,
                    height: size.height/2.09,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Center(child: Image.asset('assets/image/3.png')),
                       const SizedBox(
                          height: 40,
                        ),
          
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      marginLeft = 0;
                                      select=0;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 60,
                                    child: Text('Login',
                                        style: MyStyle.registerStyle),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      marginLeft = 160;
                                      select=1;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 65,
                                    child: Text(
                                      'Sign-up',
                                      style: MyStyle.registerStyle,
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
                            color: MyColor.buttonTextColor)
                      ],
                    ),
                  )
                ],
              ),
            IndexedStack(
                          index:select,
                         children :[
                        
                         SignUpScreen(),
                          LoginScreen()
                          ]
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
