import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';
import 'package:food_flutter/widget/suggestList.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
double margin = 0;
int select=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: AppBar(backgroundColor: MyColor.bgColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          SizedBox(width: 280),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.shopping_cart)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
            
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Delicious\nfood for you',
              style:
                  MyStyle.textStyle.copyWith(color: Colors.black, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Center(
            child: Container(
              height: 50,
              width: 314,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 185, 173, 173),
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
          SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text(
                    'Drink',
                    style: MyStyle.registerStyle,
                  ),
                  onTap: () {
                    setState(() {
                      margin = 20;
                      select=0;
                    });
                  },
                ),
              GestureDetector(
                  child: Text(
                    'Pizza',
                    style: MyStyle.registerStyle,
                  ),
                  onTap: () {
                    setState(() {
                      margin = 160;
                      select=1;
                    });
                  },
                ),
               GestureDetector(
                  child: Text(
                    'Cake',
                    style: MyStyle.registerStyle,
                  ),
                  onTap: () {
                    setState(() {
                       margin = 295; 
                       select=2;
                    });
                  
                  },
                ),
              ]),
          AnimatedContainer(
              margin: EdgeInsets.only(left: margin,top: 10),
              width: 100,
              height: 3,
              decoration: BoxDecoration(color: MyColor.TextColorOrange),
              duration: Duration(milliseconds: 200))
           ,
           IndexedStack(
            index: select,
            children: [SuggList(product: [],),Text('lk'),SuggList(product: [],)]),

        ],
      ),
   bottomNavigationBar: Container(
    width: 400,height: 60,color: Colors.black12,
   ), );
  }
}

