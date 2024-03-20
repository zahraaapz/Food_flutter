import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(GetImageEmpty());

  Future<File> getImage() async {
    emit(GetImageEmpty());
    final  image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
     File img=File(image!.path);
    emit(GetImageSuccess(img));
    if (img == null) {
      emit(GetImageNotSuccess());
    }

    return img;
  }
}
