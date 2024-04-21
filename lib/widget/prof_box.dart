import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/constant.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/screen/profile/cubit/get_image_cubit.dart';
import 'package:food_flutter/utils/sharedPre_mng.dart';

class ProfBox extends StatelessWidget {
  ProfBox({super.key,this.onTap});
  final onTap;

  var file;
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
      child: BlocBuilder<GetImageCubit, GetImageState>(
        builder: (contxt, state) {
          if (state is GetImageSuccess) {
            file = state.image;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: file == null
                      ? Image.asset('assets/image/1.png').image
                      : Image.file(file).image,
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
          );
        },
      ),
    );
  }
}
