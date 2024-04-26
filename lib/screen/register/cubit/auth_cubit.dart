import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:food_flutter/component/constant.dart';
import 'package:meta/meta.dart';
import '../../../utils/sharedPre_mng.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.account) : super(AuthInitial()) {
    // if (isLoggedIn) {
    //  emit(AuthSuccess());
    // } else {
    //   emit(NotSendEmail('error'));
    // }
  }
  final Account account;
  bool isLoggedIn = false;

  register(String email, String pass, String userName) async {
    try {
      emit(AuthLoading());

      SharedPreferencesMannager()
          .saveString(SharedPreferencesConstant.password, pass);
      SharedPreferencesMannager()
          .saveString(SharedPreferencesConstant.userName, userName);
      SharedPreferencesMannager()
          .saveString(SharedPreferencesConstant.email, email);

      await account.create(
          email: email, password: pass, userId: ID.unique(), name: userName);
      await login(email, pass);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthNotSuccess(e.toString()));
    }
  }

  login(email, pass) async {
    try {
      emit(AuthLoading());
      await account.createEmailSession(email: email, password: pass);
      await account.get();
      emit(AuthSuccess());
      isLoggedIn = true;
    } catch (e) {
      emit(AuthNotSuccess(e.toString()));
    }
  }

  updatePassword(pass,oldPass,email) async {
    try {
      emit(AuthLoading());
      await account.updatePassword(password: pass,oldPassword:oldPass);
            SharedPreferencesMannager()
          .saveString(SharedPreferencesConstant.password,pass);
      await account.get();
      emit(AuthSuccess());
      isLoggedIn = true;
    } catch (e) {
      emit(AuthNotSuccess(e.toString()));
    }
  }
}
