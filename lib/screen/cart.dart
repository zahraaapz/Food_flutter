import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_flutter/component/btn_style.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/frame_image.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: const CustomAppBar(childs: Text('Cart')),
      body: Column(
        children: [
          SizedBox(
            width: 370,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Slidable(
                  startActionPane: ActionPane(
                      extentRatio: 0.31,
                      motion: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(children: [
                          IconButton(
                              style: BtnStyle.cartSlide,
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.plus,
                                size: 12,
                                color: Colors.white,
                              )),
                          IconButton(
                              style: BtnStyle.cartSlide,
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 12,
                                color: Colors.white,
                              ))
                        ]),
                      ),
                      children: []),
                  child: Container(
                    height: 90,
                    width: 390,
                    margin: const EdgeInsets.only(left: 25, top: 10),
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
                          width: 120,
                          child: Text(
                            product.name + '\n${product.id}',
                          ),
                        ),
                        Dimens.large.width,
                        Container(
                          width: 101,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: MyColor.bgSplashScreenColor),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.plus,
                                    size: 12,
                                    color: Colors.white,
                                  )),
                              Text(
                                '1',
                                style: MyStyle.orangeBtnText
                                    .copyWith(fontSize: 10),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.minus,
                                    size: 12,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}