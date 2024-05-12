import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';

List<IconData> icons = const [
      CupertinoIcons.house_fill,
      CupertinoIcons.person_fill,
      CupertinoIcons.shopping_cart,
      CupertinoIcons.clock_fill
    ];

List name=['Home','Profile','Cart','History'];

class BtnNotch extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

var dotPoint=Offset(size.width/2,8);

    var point1=Paint()
     ..color=MyColor.bgSplashScreenColor
     ..style=PaintingStyle.fill;
     var point2=Paint()
     ..color=Colors.white
     ..style=PaintingStyle.fill;

     var path=Path()
     ..moveTo(0, 0)
     ..quadraticBezierTo(2,0,8, 7)
     ..quadraticBezierTo(size.width/2, size.height/2, size.width-8, 7)
       ..quadraticBezierTo(size.width-2,0, size.width, 0)
     ..close();
     canvas.drawPath(path, point1);
     canvas.drawCircle(dotPoint,5.5, point2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
 return false;
  }


}