import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/text_style.dart';

import '../component/dim.dart';

class TiltleBox extends StatelessWidget {
final  String title;

  TiltleBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      width: 390,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Row(
        children: [
          Dimens.medium.width,
          Text(title,style: MyStyle.text,),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.forward))
        ],
      ),
    );
  }
}