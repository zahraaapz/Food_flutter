import 'package:flutter/material.dart';
import 'package:food_flutter/widget/frame_image.dart';

import '../component/style.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, this.product, required this.i});
  final product;
  final i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(5),
        height: 240,
        width: 200,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 14,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0.5)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: '$i',
              child: FrameImage(
                product: product,
              ),
            ),
            Text(
              product.name,
              style:
                  MyStyle.text,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
