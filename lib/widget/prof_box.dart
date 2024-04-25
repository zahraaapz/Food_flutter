import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
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

 String ? duplicateFilePath;

  String? email =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.email);

  String? userName =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.userName);

  String? pass =
      SharedPreferencesMannager().getString(SharedPreferencesConstant.password);


Future getAppDoc()async{
  final duplicateFile = await getApplicationDocumentsDirectory();
   duplicateFilePath = duplicateFile.path;

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppDoc();
  }

  @override
  Widget build(BuildContext context) {
Image ?ima;
var hasLocalImage=File('$duplicateFilePath/bg').existsSync();
if (hasLocalImage) {
  var bytes=File('$duplicateFilePath/bg').readAsBytesSync();
  ima=Image.memory(bytes);
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
            onTap: ()async{
             await getImage();
},
            child: CircleAvatar(
              radius: 40,
              backgroundImage:
               ima == null
        ? Image.asset('assets/image/1.png').image               
        :ima.image,

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

Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
    }

    File imageFile = File(image!.path);
   await imageFile.copy('$duplicateFilePath/bg');
setState(() {
  
});

  }




}
