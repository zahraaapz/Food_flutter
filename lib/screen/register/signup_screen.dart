import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/register/cubit/auth_cubit.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../../component/dim.dart';
import '../../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.3,
      height: size.height / 1.5,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimens.small.height,
            MyTextFiled(
              txt: MyStrings.emailAddress,
              obscureText: false,
              controller: MyTextEditingController.email,
            ),
            Dimens.small.height,
            MyTextFiled(
              txt: MyStrings.userName,
              obscureText: false,
              controller: MyTextEditingController.userName,
            ),
            Dimens.small.height,
            MyTextFiled(
              txt: MyStrings.password,
              obscureText: true,
              controller: MyTextEditingController.password,
            ),
            Dimens.large.height,
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthNotSuccess) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.e)));
                }
                if (state is AuthSuccess) {
                  Navigator.pushReplacementNamed(context, RouteName.homeScreen);
                }
              },
              builder: (context, state) {
               
                return Center(
                  child: MainButton(
                    onTap: () async {
                      
                      final email = MyTextEditingController.email.text.trim();
                      final pass = MyTextEditingController.password.text.trim();
                      final userName = MyTextEditingController.userName.text.trim();

                      await BlocProvider.of<AuthCubit>(context)
                          .register(email, pass, userName);
                    },
                    size: const Size(400, 800),
                    bgcolor: MyColor.bgButtonColor,
                    txt: MyStrings.signUp,
                    txtcolor: Colors.white,
                  ),
                );
              },
            ),
          ]),
    );
  }
}
