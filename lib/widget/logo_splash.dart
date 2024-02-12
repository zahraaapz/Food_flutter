import 'package:flutter/material.dart';
import 'package:food_flutter/component/style.dart';

class LogoInSplash extends StatelessWidget {
  const LogoInSplash({
    super.key,
    this.size
  });
final Size? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            
            children: [
              Container(
                height:size!.height/11,
                width: size!.width/5.8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    ),
              ),
          Positioned(
           top: 5,
           left: 7.5,
            child: Image.asset('assets/image/3.png',scale: 2.5,))
            ],
          ),
          Text(
                'Food for\nEveryone',
                style: MyStyle.textStyle.copyWith(fontSize:55,fontWeight: FontWeight.bold),
              ), ],
      ),
    );
  }
}