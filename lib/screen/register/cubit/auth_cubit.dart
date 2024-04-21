import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:food_flutter/component/constant.dart';
import 'package:meta/meta.dart';
import '../../../utils/sharedPre_mng.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.account) : super(AuthInitial()) {
    // if (isLoggedIn) {
       emit(AuthSuccess());
    // } else {
    //   emit(NotSendEmail('error'));
    // }
  }
  final Account account;
  bool isLoggedIn = false;

  register(String email, String pass, String userName) async {
    try {
      emit(AuthInitial());

      SharedPreferencesMannager().saveString(SharedPreferencesConstant.password, pass);
      SharedPreferencesMannager().saveString(SharedPreferencesConstant.userName, userName);
      SharedPreferencesMannager().saveString(SharedPreferencesConstant.email, email);
      
      await account.create(
          email: email, password: pass, userId: ID.unique(), name: userName);
      await login(email, pass);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthNotSuccess(e.toString()));
    }
  }

  login(email, pass) async {
    await account.createEmailSession(email: email, password: pass);
     await account.get();
    isLoggedIn = true;
  }
}
