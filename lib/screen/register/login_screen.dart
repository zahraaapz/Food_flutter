import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/register/cubit/auth_cubit.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../../widget/my_dialog.dart';
import '../../widget/my_textFileld.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width / 1.3,
        height: size.height / 2.4,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTextFiled(
                controller: MyTextEditingController.email,
                txt: MyStrings.emailAddress,
                obscureText: false,
              ),
              MyTextFiled(
                txt: MyStrings.password,
                obscureText: true,
                controller: MyTextEditingController.password,
              ),
              GestureDetector(
                onTap: () {
                  myDialog(context);
                },
                child: Text(
                  MyStrings.forgotPassword,
                  style: MyStyle.whiteBtnText,
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                if (state is AuthNotSuccess) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.e)));
                }
                if (state is AuthSuccess) {
                  Navigator.pushReplacementNamed(context, RouteName.homeScreen);
                }
              }, builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: MainButton(
                    onTap: () async {
                      final email = MyTextEditingController.email.text.trim();
                      final pass = MyTextEditingController.password.text.trim();

                      await BlocProvider.of<AuthCubit>(context)
                          .login(email, pass);
                    },
                    size: const Size(400, 800),
                    bgcolor: MyColor.bgButtonColor,
                    txt: MyStrings.login,
                    txtcolor: Colors.white,
                  ),
                );
              }),
            ]));
  }

}
