import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'sending_data_state.dart';

class SendingDataCubit extends Cubit<SendingDataState> {
  SendingDataCubit() : super(SendingDataInitial());
  Future <void>addProfile({required String userId,required String email ,required String name ,required String medicalHistory , required String age,required String gender })async{
    emit(SendingDataLoading());
     var collection =await FirebaseFirestore.instance.collection('Profile');
     collection.doc(userId).set({
       'name':name,
       'emaill':email,
       'gender':gender,
       'age':age,
       'medical history':medicalHistory,}).then((_){
         emit(SendingDataAccepted());
     }).catchError((e){
       emit(SendingDataFail(errorMessage: e));
     });


  }
}
