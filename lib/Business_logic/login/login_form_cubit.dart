import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'login_form_state.dart';
class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(LoginFormInitial());
  static LoginFormCubit get(context)=>BlocProvider.of(context);
  Future <void> login({required String emailAddress,required String password})async{
    emit(LoadingForm());
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,

      );
      emit(LoginAccepted());
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
        emit(LoginFail(errorMesseage: 'your email or password is incorrect.'));
      }
    }
Future <void>forgetPassword({required String email }) async{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
    }

