import 'package:flutter/material.dart';
import 'package:food_flutter/widget/frame_image.dart';

import '../component/text_style.dart';
import '../screen/detail_product.dart';

class StackForLists extends StatelessWidget {
  const StackForLists({
    super.key,
    required this.list,
    required this.i,
  });

  final List list;
  final i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProduct(product: list[i], i: i),
            ));
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 38, left: 18),
          padding: const EdgeInsets.only(left: 8, right: 8, top: 80),
          width: 220,
          height: 220,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 14,
                blurStyle: BlurStyle.normal,
                spreadRadius: 2)
          ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            list[i].name,
            style: MyStyle.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
        ),
        Positioned(
          left: 65,
          top: 15,
          child: FrameImage(image: list[i]),
        )
      ]),
    );
  }
}
