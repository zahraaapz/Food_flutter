import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/main_button.dart';
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
      appBar: const CustomAppBar(childs: Text('Details')),
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
                      product: product, size: 350, shape: BoxShape.rectangle)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Text(
                    product.name,
                    style: MyStyle.textStyle
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                ),
                Dimens.small.width,
                Text('700\$',
                    style: MyStyle.textStyle
                        .copyWith(color: Colors.black, fontSize: 20)),
              ],
            ),
            SizedBox(
              width: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery info',
                    style: MyStyle.textStyle
                        .copyWith(color: Colors.black, fontSize: 20)),
                  Text(
                      "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm"),
                  Text('Return policy',
                    style: MyStyle.textStyle
                        .copyWith(color: Colors.black, fontSize: 20)),
                  Text(
                      'All our foods are double checked before leaving our stores so by \n any case you found a broken food please contact \nour hotline immediately.'),
                ],
              ),
            ),
            MainButton(
              onTap: () {},
              size: size,
              txtcolor: Colors.white,
              txt: 'Add to Cart',
              bgcolor: MyColor.bgButtonColor,
            ),
            
          ],
        ),
      ),
    );
  }
}
