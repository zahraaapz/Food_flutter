import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/data/model/wish.dart';
import 'package:food_flutter/widget/frame_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

String box='MyBox';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, this.list});
  final list;

  @override
  State<WishListScreen> createState() => _CartListState();
}

class _CartListState extends State<WishListScreen> {
  late List qnty;

initHive()async{
    await getApplicationDocumentsDirectory().then((value) => Hive.init(value.path));
    Hive.registerAdapter(WishAdapter());
    await Hive.openBox<Wish>(box);
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qnty = List.generate(widget.list.length, (index) => 1);
    initHive();
  }
final myBox=Hive.box(box);
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
                    key: Key('$index'),
                    startActionPane: ActionPane(
                        extentRatio: 0.34,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (ctx) {},
                            icon: CupertinoIcons.heart,
                            backgroundColor: MyColor.bgSplashScreenColor,
                          ),
                          SlidableAction(
                            onPressed: (ctx) {
                              setState(() {
                                widget.list.remove(widget.list[index]);
                              });
                            
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
      ),

    );
  }
}
