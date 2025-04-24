import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context)=>BlocProvider.of(context);
  Future <void> sendLink({required String email}) async {
    emit(ForgetPasswordLoading());
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordAccept());
    }
    catch(e){
      emit(ForgetPasswordError(errorMesseage: 'The Email is not Found '));
    }
  }
}
