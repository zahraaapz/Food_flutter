import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/data/model/home.dart';
import 'package:food_flutter/screen/main_screen.dart';
import 'package:food_flutter/widget/suggestList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;
  int selectBtmNav = 0;
  Home home = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: MyColor.bgColor,
          statusBarColor: MyColor.bgColor
        ),
        backgroundColor: MyColor.bgColor,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          (Dimens.large * 13).width,
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.shopping_cart)),
          Dimens.medium.width,
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Delicious\nfood for you',
              style:
                  MyStyle.text.copyWith( fontSize: 40),
            ),
          ),
          Dimens.large.height,
          Center(
            child: Container(
              height: 50,
              width: 314,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'search',
                  prefixIcon: Icon(CupertinoIcons.search),
                ),
              ),
            ),
          ),
          (Dimens.large + 10).height,
          cateList(),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => select == 0
                        ? MainScreen(home.pastaList)
                        : select == 1
                            ? MainScreen(home.dessertList)
                            : select == 2
                                ? MainScreen(home.veganList)
                                : select == 3
                                    ? MainScreen(home.porkList)
                                    : select == 4
                                        ? MainScreen(home.sideList)
                                        : select == 5
                                            ? MainScreen(home.staterist)
                                            : select == 6
                                                ? MainScreen(home.chickenList)
                                                : select == 7
                                                    ? MainScreen(
                                                        home.cocoaList)
                                                    : select == 8
                                                        ? MainScreen(
                                                            home.shakeList)
                                                        : MainScreen(home
                                                            .cocktailList))),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 18),
                  child: Text(
                    'See more',
                    style: MyStyle.orangeBtnText
                        .copyWith(color: MyColor.TextColorOrange),
                  ),
                )),
          ),
          IndexedStack(index: select, children: [
            SuggList(
              product: home.pastaList,
            ),
            SuggList(
              product: home.dessertList,
            ),
            SuggList(
              product: home.veganList,
            ),
            SuggList(
              product: home.porkList,
            ),
            SuggList(
              product: home.sideList,
            ),
            SuggList(
              product: home.staterist,
            ),
            SuggList(
              product: home.chickenList,
            ),
            SuggList(
              product: home.cocoaList,
            ),
            SuggList(
              product: home.shakeList,
            ),
            SuggList(
              product: home.cocktailList,
            ),
          ]),
        ],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  SizedBox cateList() {
    List cate = [
      'Pasta',
      'Dessert',
      'Vegan',
      'Pork',
      'Side',
      'Starter',
      'Chicken',
      'Cocoa',
      'Shake',
      'Cocktail'
    ];
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: cate.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                select = index;
              });
            },
            child: Text(
              cate[index],
              style:index != select ?  MyStyle.text:MyStyle.whiteBtnText,
            ),
          ),
        ),
      ),
    );
  }

  Container bottomNav() {
    List<IconData> icons = const [
      CupertinoIcons.house_fill,
      CupertinoIcons.heart_fill,
      CupertinoIcons.person_fill,
      CupertinoIcons.clock_fill
    ];

    return Container(
        width: 400,
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: IconButton(
                  color: MyColor.bgButtonColor,
                  onPressed: () {
                    setState(() {
                      selectBtmNav = index;
                    });
                  },
                  icon: Icon(
                    icons[index],
                    color: selectBtmNav == index
                        ? MyColor.bgButtonColor
                        : MyColor.iconColor,
                  )),
            );
          },
        ));
  }
}
