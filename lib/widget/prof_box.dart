import 'dart:io';
import 'package:food_flutter/component/color.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/constant.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
Image? ima;
class ProfBox extends StatefulWidget {
  const ProfBox({super.key});

  @override
  State<ProfBox> createState() => _ProfBoxState();
}

class _ProfBoxState extends State<ProfBox> {
  String? appDoc;


  getAppDicrectory() async {
    final directory = await getApplicationDocumentsDirectory();
    appDoc = directory.path;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppDicrectory().then((v){setState(() {});});
   }

  String? email =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.email);

  String? userName =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.userName);

  String? pass =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.password);

      
  @override
  Widget build(BuildContext context) {
  
 var localImage = File('$appDoc/bg').existsSync();
    if (localImage) {
    var byte = File('$appDoc/bg').readAsBytesSync();
    ima = Image.memory(byte); 
    }
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
            onTap: () async {
              await getImage();
             
            },
            child: CircleAvatar(
                backgroundColor: MyColor.bgSearchBarColor,
                radius: 40,
                backgroundImage: ima != null
                    ? ima!.image
                    : const ExactAssetImage('assets/image/5.png')),
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

  Future getImage() async {
    var ximage = await ImagePicker().pickImage(source: ImageSource.gallery);
    File image;  image = File(ximage!.path);
     await image.copy('$appDoc/bg').then((value) => setState((){}));
   

  }
}
