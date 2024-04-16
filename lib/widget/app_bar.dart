import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {super.key,
      required this.childs,
      this.systemOverlayStyle = const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: MyColor.bgColor,
          statusBarColor: MyColor.bgColor)});
  final childs;
  final systemOverlayStyle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      title: childs,
      backgroundColor: MyColor.bgColor,
    );
  }

  @override
  // TODO: implement child
  Widget get child => childs;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(400, 50);
}
