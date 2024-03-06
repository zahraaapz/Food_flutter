import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';

class BtnStyle{
  BtnStyle._();
  static  const cartSlide=ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      MyColor.bgButtonColor)); 
                                      
                                      
                                       static  const btnDes=ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.white));
}