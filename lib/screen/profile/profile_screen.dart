import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/screen/profile/cubit/get_image_cubit.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/btn.dart';
import '../../widget/title_box.dart';

class ProfileScreen extends StatelessWidget {
 ProfileScreen({super.key});
var file;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => GetImageCubit(),
      child: Scaffold(
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
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: BlocBuilder<GetImageCubit, GetImageState>(
             builder: (contxt, state) {
               if (state is GetImageSuccess) {
                 file=state.image;
               }
           return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          BlocProvider.of<GetImageCubit>(contxt).getImage();
                          SharedPreferencesMannager().saveString('img', file.path);
                        },
                        child: 
                        
                         CircleAvatar(
                          radius: 40,
                          backgroundImage:
                          file==null?
                           Image.asset('assets/image/1.png').image
                        :Image.file(file,).image
                         ,),
                        
                        
                        ),
                    
                    Column(
                      children: [
                        Text(
                          SharedPreferencesMannager().getString('email')!,
                          style: MyStyle.text,
                        ),
                        Text(
                          SharedPreferencesMannager().getString('pass')!,
                          style: MyStyle.caption,
                        ),
                        Text(
                          'data',
                          style: MyStyle.caption,
                        ),
                        Text(
                          'data',
                          style: MyStyle.caption,
                        ),
                      ],
                    )
                  ],
                );

               
              },
            ),
          ),
          TiltleBox(title: MyStrings.order),
          TiltleBox(title: MyStrings.pendingReview),
          TiltleBox(title: MyStrings.faq),
          TiltleBox(title: MyStrings.help),
        ]),
        bottomNavigationBar:
            btn(context, title: MyStrings.update, onTap: () {}, size: size),
      ),
    );
  }
}
