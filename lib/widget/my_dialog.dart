
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/screen/register/cubit/auth_cubit.dart';
import 'package:food_flutter/widget/my_textFileld.dart';

import '../component/txt_editor_conrl.dart';

Future<dynamic> myDialog(BuildContext context) {
    return showDialog(
                  context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                         body: SizedBox(
                          height: 355,
                           child: AlertDialog(
                              content: Column(
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
                                  MyTextFiled(
                                    txt: MyStrings.newPassword,
                                    obscureText: true,
                                    controller: MyTextEditingController.newPassword,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthCubit>(context)
                                          .updatePassword(
                                              MyTextEditingController
                                                  .newPassword.text,
                                                   MyTextEditingController
                                                  .password.text,
                                MyTextEditingController.email.text);
                                    },
                                    child: const Text('Ok'))
                              ],
                            ),
                         ),
                        ),
                      );
                    });
  }