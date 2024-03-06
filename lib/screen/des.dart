import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:food_flutter/component/btn_style.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/widget/main_button.dart';

import '../component/strings.dart';

class Deliver extends StatefulWidget {

  Deliver({super.key});

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  int level=0;

  final controller =
      MapController(initPosition: GeoPoint(latitude: 35.7, longitude: 51.29));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent,
      body: Stack(
        children: [
          OSMFlutter(
              controller: controller,
              osmOption: const OSMOption(
                zoomOption: ZoomOption(initZoom: 10),
                isPicker: true,
              )),
          Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                onPressed: () {
                   setState((){
                 level--;
          });
                },
                icon: const Icon(Icons.arrow_back),
                style: BtnStyle.btnDes,
              )),
      Positioned(
        bottom: 10,
        left:60,
        child: MainButton(
          onTap: () async{
          await controller.getCurrentPositionAdvancedPositionPicker().then((value) => print(value));
           controller.init();
          
          setState((){
            level=1;
          });
          
          },
                size: const Size(400,800),
                txtcolor: Colors.white,
                txt:level==0?MyStrings.selectOrigin:level==1?MyStrings.selectDes:MyStrings.execute,
                bgcolor: MyColor.bgButtonColor,
        ),
      ),  ],
      ),
   
    );
  }
}
