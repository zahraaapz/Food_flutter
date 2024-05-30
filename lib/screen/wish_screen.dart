import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/data/model/product.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/frame_image.dart';
import 'package:hive_flutter/hive_flutter.dart';

String box = 'MyBoxx';
final myBox = Hive.box<Product>(box);

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: MyColor.bgColor,
        appBar: CustomAppBar(child: Text(MyStrings.wishlist)),
        body: ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context, value, child) {
              final list = value.values.toList();
              return SizedBox(
                height: 700,
                width: 410,
                child: list.isNotEmpty
                    ? ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: Key('$index'),
                            startActionPane: ActionPane(
                                extentRatio: 0.34,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx) {
                                    
                                        value.deleteAt(index);
                                     
                                    },
                                    icon: CupertinoIcons.delete,
                                    backgroundColor:
                                        MyColor.bgSplashScreenColor,
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
                                      '${list[index].name}\n${list[index].id}',
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
                                              // setState(() {
                                              //   qnty[index]++;
                                              // });
                                            },
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
                                            onPressed: () {
                                              // setState(() {
                                              //   qnty[index]--;
                                              // });
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
              );
            }));
  }
}
