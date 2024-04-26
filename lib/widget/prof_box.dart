import 'dart:convert';
import 'dart:io';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/constant.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:image_picker/image_picker.dart';


class ProfBox extends StatefulWidget {
  const ProfBox({super.key});

  @override
  State<ProfBox> createState() => _ProfBoxState();
}

class _ProfBoxState extends State<ProfBox> {

 listenForStream(){
  imageChaned.stream.listen((data){
    setState(() {
      imageString=data;
    });
  });
}


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imageChaned.close();
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenForStream();
  }


  String? email =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.email);

  String? userName =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.userName);

  String? pass =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.password);




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: ()async{
             await getImage();
},
            child: CircleAvatar(
              backgroundColor:MyColor.bgSearchBarColor ,
              radius: 40,
              backgroundImage:imageString!=null&&imageString.isNotEmpty?
              Image.memory(base64Decode(imageString)).image:
              const ExactAssetImage('assets/image/4.png')
              

            ),
          ),
          Column(
            children: [
              Text(
                'Email: ${email!}',
                style: MyStyle.text.copyWith(fontSize: 11),
              ),
              Text(
                'Password: ${pass!}',
                style: MyStyle.caption,
              ),
              Text(
                'Username: ${userName!}',
                style: MyStyle.caption,
              ),
            ],
          )
        ],
      ),
    );
  }
String imageString='';
Future getImage() async {
   var ima = await ImagePicker().pickImage(source: ImageSource.gallery);
   File image=File(ima!.path);
  List<int>imaBytes=image.readAsBytesSync();
  String base64Image=base64Encode(imaBytes);
  imageChaned.add(base64Image);
setState(() {
  imageString=base64Image;
});

  }




}
