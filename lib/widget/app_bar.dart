import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {super.key,
      required this.child,
      this.systemOverlayStyle = const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: MyColor.bgColor,
          statusBarColor: MyColor.bgColor)});
  final Widget   child;
  final systemOverlayStyle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      title: child,
      backgroundColor: MyColor.bgColor,
    );
  }
  


 @override
  Size get preferredSize => const Size(400, 50);
}
