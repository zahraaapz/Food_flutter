import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn.dart';
import 'package:food_flutter/widget/prof_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../component/color.dart';
import '../../widget/title_box.dart';
Image? ima;
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String? appDoc;
  File? image;

  getAppDicrectory() async {
    final directory = await getApplicationDocumentsDirectory();
    appDoc = directory.path;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppDicrectory();
   }

  Future getImage() async {
    var ximage = await ImagePicker().pickImage(source: ImageSource.gallery);
   image = File(ximage!.path);
    await image!.copy('$appDoc/bg').then((value) => setState((){}));
  }
  @override
  Widget build(BuildContext context) {
        var localImage = File('$appDoc/bg').existsSync();
    if (localImage) {
    var byte = File('$appDoc/bg').readAsBytesSync();
    ima = Image.memory(byte); 
    }
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: CustomAppBar(childs: Text(MyStrings.myProfile)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 12, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.personalDetails,
                style: MyStyle.text,
              ),
              Text(
                MyStrings.change,
                style: MyStyle.whiteBtnText,
              ),
            ],
          ),
        ),
        ProfBox()
        ,
        TiltleBox(title: MyStrings.order),
        TiltleBox(title: MyStrings.pendingReview),
        TiltleBox(title: MyStrings.faq),
        TiltleBox(title: MyStrings.help),
      ]),
      bottomNavigationBar:
          btn(context, title: MyStrings.update, onTap: () {}, size: size),
    );
  }
}
