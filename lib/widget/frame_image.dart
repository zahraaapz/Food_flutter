import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../component/color.dart';

class FrameImage extends StatelessWidget {
  const FrameImage({
    super.key,
    required this.image,
    this.size = 130,
    this.shape = BoxShape.circle,
  });

  final image;
  final double size;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => SizedBox(
        width: size,
        height: size,
          child: const Center(
            child: CircularProgressIndicator(
              color: MyColor.bgButtonColor,
              
            ),
          )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: image.imgUrl,
      imageBuilder: (context, ImageProvider imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: imageProvider,
            )),
      ),
    );
  }
}
