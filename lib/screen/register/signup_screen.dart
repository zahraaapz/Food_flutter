import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/register/cubit/auth_cubit.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../../widget/my_textFileld.dart';

class SignUpScreen extends StatelessWidget {
const  SignUpScreen({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SizedBox(
        width: size.width / 1.3,
        height: size.height / 1.9,
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
               if (state is NotSendEmail) {
                      ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error')));
               } if (state is SentEmail){
                     Navigator.pushReplacementNamed(
                              context, RouteName.homeScreen);
               }
                },
                builder: (context, state) {

                  return Center(
                    child: MainButton(
                      onTap: () async {
                        // if (SharedPreferencesMannager()
                        //         .getString('email')!
                        //         .isEmpty &&
                        //     SharedPreferencesMannager()
                        //         .getString('email')!
                        //         .isEmpty) {
                     
                        // }
                      
                        BlocProvider.of<AuthCubit>(context).sendEmail();
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
      ),
    );
  }
}
