import 'package:flutter/material.dart';

import '../component/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.childs});
  final childs;
  @override
  Widget build(BuildContext context) {
    return AppBar(title :childs,backgroundColor: MyColor.bgColor,);
  }

  @override
  // TODO: implement child
  Widget get child => childs;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(400, 50);
}