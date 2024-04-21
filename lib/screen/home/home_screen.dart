import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/api_key.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/screen/home/extrct_home.dart';
import 'package:food_flutter/screen/profile/profile_screen.dart';
import '../../component/color.dart';
import '../cart/cart_screen.dart';

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
      resizeToAvoidBottomInset: false,

      backgroundColor: MyColor.bgColor,
      body:Stack(
        children: [
          Positioned(
             bottom: 60,
                right: 0,
                left: 0,
                top: 0,
            child: IndexedStack(
              index: selectBtmNav,
              children: [
                ExtrctHome(select: select),
                const ProfileScreen(),
                const CartScreen(),
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
      CupertinoIcons.person_fill,
      CupertinoIcons.shopping_cart,
      CupertinoIcons.clock_fill
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
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
           
               ValueListenableBuilder(
                 valueListenable:cartCount ,
                builder: (context,value,child) {
                return Badge(count:value);
                  },
                )
             ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
 final count;

  const Badge({
    super.key,
    this.count
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count>0,
      child: Positioned(
        right: 130,
        top: 10,
        child: Container(
          height: 22,
          width: 20,
          decoration: const BoxDecoration(
            color: MyColor.bgSplashScreenColor,
            shape: BoxShape.circle
          ),
          child: Center(child: Text(count.toString(),style: MyStyle.orangeBtnText.copyWith(fontSize: 12),)),
        ),
      ),
    );
  }
}
