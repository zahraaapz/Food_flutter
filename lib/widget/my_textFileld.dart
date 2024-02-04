import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
 MyTextFiled({
    super.key,
    required this.txt,
    required this.obscureText
  });
String txt;
bool obscureText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText:obscureText ,
      cursorColor: Colors.black38,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black38),
          labelText: txt,
          focusedBorder: const UnderlineInputBorder()),
    );
  }
}