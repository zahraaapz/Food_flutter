import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/screen/cart/cart_screen.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/api_key.dart';
import '../component/color.dart';
import '../widget/app_bar.dart';
import '../widget/frame_image.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.product, required this.i});
  final product;
  final i;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar:  CustomAppBar(childs: Text(MyStrings.detail)),
      body: SizedBox(
        width: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: '$i',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FrameImage(
                      image: product, size: 350, shape: BoxShape.rectangle)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Text(
                    product.name,
                    style: MyStyle.text,
                  ),
                ),
                Dimens.small.width,
                Text('700\$',
                    style: MyStyle.text),
              ],
            ),
            SizedBox(
              width: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.deliveryInfo,
                    style: MyStyle.text),
                  Text(
                      MyStrings.deliveryInfoCaption,style: MyStyle.caption,),
                  Text(MyStrings.returnPolicy,
                    style: MyStyle.text),
                  Text(MyStrings.returnPolicyCaption
                      ,style: MyStyle.caption,),
                ],
              ),
            ),
            MainButton(
              onTap: () {

               cart.add(product);
                Navigator.push(context,MaterialPageRoute(builder:(context) => const CartScreen()));
              },
              size: size,
              txtcolor: Colors.white,
              txt:MyStrings.addtoCart,
              bgcolor: MyColor.bgButtonColor,
            ),
            
          ],
        ),
      ),
    );
  }
}
