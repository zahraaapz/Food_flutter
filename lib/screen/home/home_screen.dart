import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/main.dart';
import 'package:food_flutter/screen/home/bloc/home_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
     final homeBloc=HomeBloc(iHomeRepo);
      homeBloc.add(HomeInit());
      return homeBloc;
      },
      child: Scaffold(
        backgroundColor: MyColor.bgColor,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: MyColor.bgColor,
              statusBarColor: MyColor.bgColor),
          backgroundColor: MyColor.bgColor,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            (Dimens.large * 13).width,
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.shopping_cart)),
            Dimens.medium.width,
          ]),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
         builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
         
         if (state is HomeLoaded) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  MyStrings.homeTitle,
                  style: MyStyle.text.copyWith(fontSize: 40),
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
                  child:  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: MyStrings.search,
                      prefixIcon: const Icon(CupertinoIcons.search),
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
                            ? MainScreen(state.home.pastaList!)
                            : select == 1
                                ? MainScreen(state.home.dessertList!)
                                : select == 2
                                    ? MainScreen(state.home.veganList!)
                                    : select == 3
                                        ? MainScreen(state.home.porkList!)
                                        : select == 4
                                            ? MainScreen(state.home.sideList!)
                                            : select == 5
                                                ? MainScreen(state.home.staterist!)
                                                : select == 6
                                                    ? MainScreen(
                                                        state.home.chickenList!)
                                                    : select == 7
                                                        ? MainScreen(
                                                            state.home.cocoaList!)
                                                        : select == 8
                                                            ? MainScreen(
                                                                state.home.shakeList!)
                                                            : MainScreen(state.home
                                                                .cocktailList!))),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0, right: 18),
                      child: Text(
                        MyStrings.seeMore,
                        style: MyStyle.orangeBtnText
                            .copyWith(color: MyColor.TextColorOrange),
                      ),
                    )),
              ),
              IndexedStack(index: select, children: [
                SuggList(
                  product: state.home.pastaList!,
                ),
                SuggList(
                  product: state.home.dessertList!,
                ),
                SuggList(
                  product: state.home.veganList!,
                ),
                SuggList(
                  product: state.home.porkList!,
                ),
                SuggList(
                  product: state.home.sideList!,
                ),
                SuggList(
                  product: state.home.staterist!,
                ),
                SuggList(
                  product: state.home.chickenList!,
                ),
                SuggList(
                  product: state.home.cocoaList!,
                ),
                SuggList(
                  product: state.home.shakeList!,
                ),
                SuggList(
                  product: state.home.cocktailList!,
                ),
              ]),
            ],
          );
        }
         else{
         return  const Center(child: Text('error'));
          }}),
        bottomNavigationBar: bottomNav(),
      ),
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
              style: index != select ? MyStyle.text : MyStyle.whiteBtnText,
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
