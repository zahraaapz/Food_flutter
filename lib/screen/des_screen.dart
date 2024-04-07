import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:food_flutter/component/btn_style.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/widget/main_button.dart';
import '../component/strings.dart';
import '../component/api_key.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
 List <GeoPoint> geoPoint=[];
  final controller =
      MapController(initPosition: GeoPoint(latitude: 35.7, longitude: 51.29));
  final icon = Image.asset('assets/image/placeholder.png', scale: 10);
  String address = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                markerOption: MarkerOption(
                    advancedPickerMarker: MarkerIcon(
                  iconWidget: icon,
                )),
                zoomOption: const ZoomOption(initZoom: 10),
                isPicker: true,
              )),
          Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (geoPoint.isEmpty) {
                      Navigator.of(context).pop();
                    } else {
                  
                    address='';
                    controller.removeMarker(geoPoint.last);
                    geoPoint.remove(geoPoint.last);
                    }
                  
                  });
                  controller.advancedPositionPicker();
                  
                },
                icon: const Icon(Icons.arrow_back),
                style: BtnStyle.btnDes,
              )),
          destination()
        ],
      ),
    );
  }

  execute() {
    controller.zoomOut();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context,setState) => Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/image/destination.png',
                      scale: 9,
                    ),
                    SizedBox(width: 230,child: Text(address,style: MyStyle.text,)),
                  ],
                ),
                MainButton(
                    onTap:(){
                      Navigator.pushNamed(context,RouteName.homeScreen);
                    },
                    size: const Size(400, 800),
                    txtcolor: Colors.white,
                    txt: MyStrings.execute,
                    bgcolor: MyColor.bgButtonColor)
              ],
            ),
          ),
        );
      },
    );
  }

  Positioned destination() {
    return Positioned(
      bottom: 10,
      left: 60,
      child: MainButton(
        onTap: () async {
          await controller
              .getCurrentPositionAdvancedPositionPicker()
              .then((value) {
            geoPoint.add(value);
          });
          controller.cancelAdvancedPositionPicker();

          await controller.addMarker(geoPoint.first,
              markerIcon: MarkerIcon(
                iconWidget: icon,
              ));
           await getAddress(
              lng: geoPoint.first.longitude, lat: geoPoint.first.latitude).then((value) {
 setState(() {
            address = value;
          });
              });
         

          execute();
       
        },
        size: const Size(400, 800),
        txtcolor: Colors.white,
        txt: MyStrings.selectDes,
        bgcolor: MyColor.bgButtonColor,
      ),
    );
  }
}
