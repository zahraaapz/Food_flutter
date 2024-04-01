import 'package:bloc/bloc.dart';
import 'package:food_flutter/component/api_key.dart';
import 'package:food_flutter/component/txt_editor_conrl.dart';
import 'package:meta/meta.dart';

import '../../../utils/sharedPre_mng.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){
    emit(SentEmail());
  }

  sendEmail() async {
    try {

      await Auth.verifyeCode({
        'ishtml': 'false',
        'sendto': MyTextEditingController.email.text,
        'name': 'Hi',
        'replyTo': 'your mail where users can send reply',
        'title': 'Auth',
        'body': '${MyTextEditingController.password.text} is your password.'
      });
      emit(SentEmail());
      SharedPreferencesMannager()
          .saveString('pass', MyTextEditingController.password.text);
      SharedPreferencesMannager()
          .saveString('email', MyTextEditingController.email.text);
    } catch (e) {
      emit(NotSendEmail());
    }
  }
}
