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
        IconButton(onPressed: (){}, icon:const Icon(Icons.menu)),
        SizedBox(width:280),
        IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.shopping_cart)),
        SizedBox(width: 20,)
       ], 
      ),
      body:Column(children: [
Text('Delicious\nfood for you',style: MyStyle.textStyle.copyWith(color: Colors.black,fontSize:40),),
  SizedBox(height: 20,),
Center(
  child: Container(
    height: 60,
    width: 314,
    decoration:BoxDecoration(color: MyColor.bgRegisterScreenColor,borderRadius: BorderRadius.circular(30)),
    child: const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'search',
        prefixIcon:Icon(CupertinoIcons.search) ,
        
      ),
    ),
  ),
)

      ],) ,
    );
  }
}