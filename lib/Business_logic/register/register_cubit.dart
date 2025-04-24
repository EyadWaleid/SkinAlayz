import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void>sendEmailandPassword({required String emailAddress, required String password})async {
    try {
      emit(RegisterLoading());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(RegisterAccepted());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterRejected(errorMessage:'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterRejected(errorMessage:'The account already exists for that email.'));
      }
      else{
        emit(RegisterRejected(errorMessage: e.code));
      }
    } catch (e) {
      print(e);
    }

  }
  Future <void> sendUserData({ required String email, required String name ,required String gender ,required int age ,required String medicalHistory  })async{

}
}
