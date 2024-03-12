import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/screen/home/extrct_home.dart';
import 'package:food_flutter/screen/profile_screen.dart';

import '../../component/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;

  int selectBtmNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: MyColor.bgColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 60,
            right: 0,
            left: 0,
            top:0,
            child: IndexedStack(
              index: selectBtmNav,
              children: [
                ExtrctHome(
                  select: select,
                 
                ),
                ProfileScreen()
              ],
            ),
          ),
          bottomNavBar(),
        ],
      ),
    );
  }

  bottomNavBar() {
    List<IconData> icons = const [
      CupertinoIcons.house_fill,
      CupertinoIcons.heart_fill,
      CupertinoIcons.person_fill,
      CupertinoIcons.clock_fill
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: 410,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.black12,
           ),
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
          )),
    );
  }
}
