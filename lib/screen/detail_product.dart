import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/data/model/product.dart';
import 'package:food_flutter/screen/cart/bloc/cart_bloc.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/api_key.dart';
import '../component/color.dart';
import '../widget/app_bar.dart';
import '../widget/frame_image.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.product, required this.i});
  final product;
  final i;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<Product> wishProduct = [];
  @override
  void initState() {
    super.initState();
    wishProduct = myWishBox.values
        .where((element) => widget.product.id == element.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: CustomAppBar(child: Text(MyStrings.detail)),
      body: SizedBox(
        width: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: '${widget.i}',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FrameImage(
                      image: widget.product,
                      size: 350,
                      shape: BoxShape.rectangle)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Text(
                    widget.product.name,
                    style: MyStyle.text,
                  ),
                ),
                Dimens.small.width,
                Text('700\$', style: MyStyle.text),
              ],
            ),
            SizedBox(
              width: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.deliveryInfo, style: MyStyle.text),
                  Text(
                    MyStrings.deliveryInfoCaption,
                    style: MyStyle.caption,
                  ),
                  Text(MyStrings.returnPolicy, style: MyStyle.text),
                  Text(
                    MyStrings.returnPolicyCaption,
                    style: MyStyle.caption,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (){
                      if (wishProduct.isEmpty) {
                        Product productFav = Product(
                            id: widget.product.id,
                            name: widget.product.name,
                            imgUrl: widget.product.imgUrl,
                            isFav: false);

                        myWishBox.add(productFav);
                        setState(() {
                          wishProduct = [productFav];
                        });
                      }

                      if (wishProduct.isNotEmpty) {
                        for (var e in myWishBox.values) {
                          if (e.id == widget.product.id) {
                            setState(() {
                              e.isFav = !e.isFav;
                            });

                            if (!e.isFav) {
                              if (myWishBox.values.contains(wishProduct.first)) {
                                final index =
                                    myWishBox.values.toList().indexOf(wishProduct.first);
                                myWishBox.deleteAt(index);
                                setState(() {
                                  wishProduct = [];
                                });
                              }
                            }
                          }
                        }
                      }
                    },
                    icon: wishProduct.isNotEmpty
                        ? const Icon(
                            CupertinoIcons.heart_fill,
                            size: 30,
                            color: MyColor.bgSplashScreenColor,
                          )
                        : const Icon(
                            CupertinoIcons.heart,
                            size: 30,
                            color: MyColor.bgSplashScreenColor,
                          )),
                MainButton(
                  onTap: () {
                    if (myCartBox.isNotEmpty) {
                        for (var e in myCartBox.values) {
                          if (e.id != widget.product.id) {
                           myCartBox.add(Product(id: widget.product.id, imgUrl: widget.product.imgUrl,
                            name:widget.product.name, isFav: false));
                          }
                        }
                      }
                        if (myCartBox.isEmpty) {
                      

                        myCartBox.add(Product(
                            id: widget.product.id,
                            name: widget.product.name,
                            imgUrl: widget.product.imgUrl,
                            isFav: false));
                      
                      }

                    BlocProvider.of<CartBloc>(context).add(CartEventInit());

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor:
                            MyColor.bgSplashScreenColor.withOpacity(0.8),
                        duration: const Duration(milliseconds: 700),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0.5,
                        margin: const EdgeInsets.only(
                            bottom: 670, left: 18, right: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        content: SizedBox(
                            height: 40,
                            child: Text(
                              'Added to Cart',
                              style: MyStyle.orangeBtnText,
                              textAlign: TextAlign.justify,
                            ))));
                  },
                  size: size,
                  txtcolor: Colors.white,
                  txt: MyStrings.addtoCart,
                  bgcolor: MyColor.bgButtonColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
