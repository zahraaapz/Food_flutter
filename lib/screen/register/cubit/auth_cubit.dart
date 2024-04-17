import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../utils/sharedPre_mng.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.account) : super(AuthInitial()){
     emit(SentEmail()); 
  }
  final Account account;


register(String email,String pass,String userName) async {
    try {
      
         SharedPreferencesMannager()
          .saveString('pass',pass);
         SharedPreferencesMannager()
          .saveString('userName',userName);
      SharedPreferencesMannager()
          .saveString('email',email);
   await  account.create(email:email, password:pass,userId:ID.unique(),name:userName);
   await  login(email,pass);
      emit(SentEmail());
      
    } catch (e) {
      emit(NotSendEmail(e.toString()));
    }
  }



login(email,pass)async{
  await   account.createEmailSession(email: email, password: pass);
    
  await   account.get();
  }
}
