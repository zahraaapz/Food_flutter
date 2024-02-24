import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
 const MyTextFiled({
    super.key,
    required this.txt,
    required this.controller,
    required this.obscureText
  });
 final String txt;
 final bool obscureText;
 final controller;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller:controller,
      obscureText:obscureText ,
      cursorColor: Colors.black38,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black38),
          labelText: txt,
          focusedBorder: const UnderlineInputBorder()),
    );
  }
}