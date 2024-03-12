import 'package:flutter/material.dart';


class FrameImage extends StatelessWidget {
  const FrameImage({
    super.key,
    required this.image,
    this.size=130,
    this.shape=BoxShape.circle,
  });

  final  image;
  final double size;
  final BoxShape shape;


  @override
  Widget build(BuildContext context) {

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
       shape: shape,
          image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: Image.network(
                image.imgUrl,
              ).image)),
    );
  }
}