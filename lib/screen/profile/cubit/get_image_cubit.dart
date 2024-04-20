import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../../utils/sharedPre_mng.dart';
part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(GetImageEmpty());

  Future getImage() async {
    emit(GetImageEmpty());
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      emit(GetImageNotSuccess());
    }
    
    File imageFile = File(image!.path);
    final duplicateFile = await getApplicationDocumentsDirectory();
    final duplicateFilePath = duplicateFile.path;
    final fileName = path.basename(imageFile.path);
    final localImage = await imageFile.copy('$duplicateFilePath/$fileName');
    SharedPreferencesMannager().saveString('ima',localImage.path);
    emit(GetImageSuccess(File(SharedPreferencesMannager().getString('ima')!)));
  }
}
