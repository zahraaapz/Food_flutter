import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_flutter/component/api_key.dart';
import 'package:food_flutter/component/btn_style.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/cart/bloc/cart_bloc.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn.dart';
import 'package:food_flutter/widget/frame_image.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final b = CartBloc();
        b.add(CartEventInit());
        return b;
      },
      child: Scaffold(
        appBar: CustomAppBar(childs: Text(MyStrings.cart)),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CartLoaded) {
              return CartList(list: state.cart);
            } else if (state is CartDeleteItem) {
              return CartList(list: state.cart);
            } else if (state is CartAddItem) {
              if (state.cart.isNotEmpty) {
                return CartList(list: state.cart);
              } else {
                return Center(
                    child: Text(
                  'j',
                  style: MyStyle.whiteBtnText,
                ));
              }
            } else if (state is CartRemoveItem) {
              return CartList(list: state.cart);
            } else {
              return Center(
                  child: Text(
                'j',
                style: MyStyle.whiteBtnText,
              ));
            }
          },
        ),
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key, this.list});
  final list;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      body: SizedBox(
        height: 700,
        width: 410,
        child: widget.list.isNotEmpty
            ? ListView.builder(
                itemCount: widget.list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                        extentRatio: 0.34,
                        motion: const ScrollMotion(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      style: BtnStyle.cartSlide,
                                      onPressed: () {},
                                      icon: const Icon(
                                        CupertinoIcons.heart,
                                        size: 14,
                                        color: Colors.white,
                                      )),
                                  Dimens.small.width,
                                  IconButton(
                                      style: BtnStyle.cartSlide,
                                      onPressed: () {
                                        setState(() {
                                          widget.list
                                              .remove(widget.list[index]);
                                        });
                                        BlocProvider.of<CartBloc>(context)
                                            .add(CartEventDelete());
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.delete,
                                        size: 14,
                                        color: Colors.white,
                                      ))
                                ]),
                          ),
                        ]),
                    child: Container(
                      height: 90,
                      margin:
                          const EdgeInsets.only(left: 10, top: 10, right: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          FrameImage(
                            image: widget.list[index],
                            size: 70,
                          ),
                          Dimens.large.width,
                          SizedBox(
                            width: 120,
                            child: Text(
                              widget.list[index].name +
                                  '\n${widget.list[index].id}',
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
              )
            : Center(
                child: Text(
                'List is Empty',
                style: MyStyle.whiteBtnText,
              )),
      ),
      bottomNavigationBar: Visibility(
        visible: widget.list.isNotEmpty,
        child: btn(context, title: MyStrings.completeOrder, onTap: () {
          Navigator.pushNamed(context, RouteName.destination);
        }, size: size),
      ),
    );
  }
}
