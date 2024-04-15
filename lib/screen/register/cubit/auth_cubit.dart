import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../utils/sharedPre_mng.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.account) : super(AuthInitial());
  final Account account;


Future  register(String email,String pass) async {
    try {

      await account.create(userId:ID.unique(), email: email, password: pass);
      await login(email,pass);

      emit(SentEmail());
      SharedPreferencesMannager()
          .saveString('pass',pass);
      SharedPreferencesMannager()
          .saveString('email',email);
    } catch (e) {
      emit(NotSendEmail(e.toString()));
    }
  }



  Future login(email,pass)async{
    await account.createEmailPasswordSession(email: email, password: pass);
    await account.get();
  }
}
