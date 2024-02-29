import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/frame_image.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: CustomAppBar(
          childs: Row(
        children: [Text('Cart')],
      )),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 90,
                width: 370,
                margin:EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    FrameImage(
                      product: product,
                      size: 70,
                    ),
                    Dimens.large.width,
                    SizedBox(
                      width: 150,
                      child: Text(product.name + '\n${product.id}'),
                    ),      Dimens.large.width,
                    Container(
                      width: 101,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: MyColor.bgSplashScreenColor
                      ),

                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.plus,size: 12,color: Colors.white,)),
                          Text(
                            '1',
                            style: MyStyle.orangeBtnText.copyWith(fontSize: 10),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.minus,size: 12,color: Colors.white,)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
