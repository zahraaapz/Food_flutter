import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/data/model/product.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/cart/bloc/cart_bloc.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/_special_btn.dart';
import 'package:food_flutter/widget/frame_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../component/api_key.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(child: Text(MyStrings.cart)),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoadError) {
             return Center(
                child: Text(
              'Error',
              style: MyStyle.whiteBtnText,
            ));
           
          } else {
            return CartList();
          }
        },
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key,});


  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  late List qnty;
  @override
  void initState() {
    super.initState();
    qnty = List.generate(myCartBox.length, (index) => 1);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      body: SizedBox(
        height: 700,
        width: 410,
        child: myCartBox.isNotEmpty
            ? ValueListenableBuilder(
                valueListenable: myCartBox.listenable(),
                builder:
                    (BuildContext context, Box<Product> box, Widget? child) =>
                        ListView.builder(
                  itemCount: box.values.toList().length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                 final   list=box.values.toList();
                    return Slidable(
                      key: Key('$index'),
                      startActionPane: ActionPane(
                          extentRatio: 0.34,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (ctx) {
                                myWishBox.add(Product(
                                    name: list[index].name,
                                    id: list[index].id,
                                    imgUrl: list[index].imgUrl,
                                    isFav: false));
                              },
                              icon: CupertinoIcons.heart,
                              backgroundColor: MyColor.bgSplashScreenColor,
                            ),
                            SlidableAction(
                              onPressed: (ctx) {
                                setState(() {
                                 myCartBox.deleteAt(index);

                                });
                                BlocProvider.of<CartBloc>(context)
                                    .add(CartEventDelete());
                              },
                              icon: CupertinoIcons.delete,
                              backgroundColor: MyColor.bgSplashScreenColor,
                            ),
                          ]),
                      child: Container(
                        height: 90,
                        margin: const EdgeInsets.only(
                            left: 15, top: 10, right: 15, bottom: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            FrameImage(
                              image: list[index],
                              size: 70,
                            ),
                            Dimens.large.width,
                            SizedBox(
                              width: 120,
                              child: Text(
                                list[index].name +
                                    '\n${list[index].id}',
                              ),
                            ),
                            (Dimens.large * 1.5).width,
                            Container(
                              width: 110,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: MyColor.bgSplashScreenColor),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          qnty[index]++;
                                        });
                                        BlocProvider.of<CartBloc>(context)
                                            .add(CartEventAdd());
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.plus,
                                        size: 12,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    qnty[index].toString(),
                                    style: MyStyle.orangeBtnText
                                        .copyWith(fontSize: 10),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          qnty[index]--;
                                        });
                                        BlocProvider.of<CartBloc>(context)
                                            .add(CartEventRemove());
                                      },
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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/5.png'),
                  Dimens.medium.height,
                  Text(
                    '  List is Empty',
                    style: MyStyle.whiteBtnText,
                  ),
                ],
              ),
      ),
      bottomNavigationBar: Visibility(
        visible: myCartBox.isNotEmpty,
        child: specialBtn(context, title: MyStrings.completeOrder, onTap: () {
          Navigator.pushNamed(context, RouteName.destination);
        }, size: size),
      ),
    );
  }
}
