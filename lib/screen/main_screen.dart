import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        children: [
          Text(
            'Delicious\nfood for you',
            style:
                MyStyle.textStyle.copyWith(color: Colors.black, fontSize: 40),
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
                  color: MyColor.bgRegisterScreenColor,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ListTile(title: Text('Drink')),
            ListTile(title: Text('Pizza'),),
            ListTile(title: Text('Cake'),),
          ]),
          AnimatedContainer(duration: Duration(milliseconds: 200))
         ,SuggList()
       
       
        ],
      ),
    );
  }
}

class SuggList extends StatelessWidget {
  const SuggList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 400,
      child: ListView.builder(
       scrollDirection: Axis.horizontal,
       shrinkWrap:true,
       itemCount: 4,
       itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children:[
           Container(
             margin: EdgeInsets.only(top:18),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
               Text('mnjh')
             ],),
             width: 220,
             height: 270,
             decoration: BoxDecoration(
               boxShadow: [BoxShadow(color: Colors.black12,blurRadius:2,blurStyle: BlurStyle.normal,spreadRadius:2)],
               color: MyColor.bgRegisterScreenColor,
               borderRadius: BorderRadius.circular(30)
             ),
           ),
           Positioned(
             left: 50,
             child: Image.asset('assets/image/5.png',scale:1.1,)),
                      
          ]),
        );
      },),
    );
  }
}
