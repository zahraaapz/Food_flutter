import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/color.dart';
import '../widget/frame_image.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.product,required this.i});
  final product;
  final i;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SizedBox(
          width: 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(
                tag:'$i',
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FrameImage(
                        product: product, size: 350, shape: BoxShape.rectangle)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: MyStyle.textStyle
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                  Dimens.small.width,
                  Text('700\$',
                      style: MyStyle.textStyle
                          .copyWith(color: Colors.black, fontSize: 20)),
                ],
              ),
              MainButton(
                onTap: () {
                  
                },
                size: size,
                txtcolor: Colors.white,
                txt: 'Select',
                bgcolor: MyColor.bgButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
