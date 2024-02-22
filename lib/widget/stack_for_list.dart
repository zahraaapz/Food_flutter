import 'package:flutter/material.dart';
import 'package:food_flutter/component/extention.dart';

import '../component/dim.dart';

class StackForLists extends StatelessWidget {
  const StackForLists({
    super.key,
    required this.list,
    required this.index,
  });

  final List list;
  final index;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(top: 38, left: 18),
        width: 220,
        height: 270,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              spreadRadius: 2)
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [(Dimens.large * 2).height, Text(list[index].name)],
        ),
      ),
      Positioned(
          left: 65,
          top: 15,
          child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: Image.network(
                      list[index].imgUrl,
                    ).image)),
          )),
    ]);
  }
}
