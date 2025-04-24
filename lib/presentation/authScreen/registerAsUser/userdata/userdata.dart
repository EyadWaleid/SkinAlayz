import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/Business_logic/SendingData/sending_data_cubit.dart';
import 'package:skinalayz/common/widgets/TextField.dart';
import 'package:skinalayz/common/widgets/appButton.dart';
import 'package:skinalayz/utli/constant/colours.dart';
import 'package:skinalayz/utli/constant/images.dart';

import '../../../../common/functions/functions.dart';

class UserData extends StatelessWidget {
  String? email;
  String? name;
  String? gender;
  var formKey=GlobalKey<FormState>();
  final regex = RegExp(r'^\d+$');
  ValueNotifier <bool> isMale=ValueNotifier(false);
  TextEditingController age =TextEditingController();
  TextEditingController medicalHistory =TextEditingController();
  UserData({super.key, this.email, this.name});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColour.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health Profile',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Complete Your Health Info',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white.withOpacity(0.6),fontWeight:FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 400,
                        height: 750,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Choose your gender:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        color: AppColour.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          isMale.value=false;
                                          gender='female';

                                        },
                                        child: ValueListenableBuilder(
                                          valueListenable:isMale,
                                          builder: (context, value, child) {
                                            return Container(
                                              width: 95,
                                              height: 95,
                                              decoration: BoxDecoration(
                                                color: isMale.value == true
                                                    ? AppColour.backgroundColor
                                                    : isMale.value == false
                                                    ? AppColour.primaryColor.withOpacity(0.5)
                                                    : AppColour.backgroundColor,
                                                borderRadius: BorderRadius.circular(15),

                                              ),
                                              child:Center(child: Image.asset(AppImage.womanImage,
                                                  height: 80, width: 80),) ,
                                            );
                                          },

                                        ),
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          isMale.value=true;
                                          gender="Male";
                                        },
                                        child: ValueListenableBuilder(
                                          builder:(context, value, child) {
                                            return Container(
                                              width: 95,
                                              height: 95,
                                              decoration: BoxDecoration(
                                                color:isMale.value == true
                                                    ? AppColour.primaryColor.withOpacity(0.5)
                                                    : isMale.value == false
                                                    ? AppColour.backgroundColor
                                                    :AppColour.backgroundColor,
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                  child: Image.asset(AppImage.manImage,
                                                      height: 80, width: 80)),
                                            );
                                          } ,
                                          valueListenable:isMale!,

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),


                              FormBox(labeled:'Age', icon: Icons.numbers, controller:age,
                                isFilled: true,
                                validator: (e){
                                  if(e!.isEmpty){
                                    return 'you must fill this field';
                                  }
                                  else if(!e.contains(regex)){
                                    return 'Enter numbers only';
                                  }
                                },),

                              Container(
                                width: 350,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: AppColour.backgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Medical history',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      TextField(
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Enter your text',
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                        ),
                                        controller:medicalHistory ,
                                        maxLines: 6,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AppButton(label: 'Create',function: () {
                                BlocProvider.of<SendingDataCubit>(context).addProfile(userId:FirebaseAuth.instance.currentUser!.uid , email: email!, name: name!, medicalHistory:medicalHistory.text , age: age.text, gender:gender! );

                              },),
                              _stateListener()

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  BlocListener<SendingDataCubit, SendingDataState> _stateListener() {
    return BlocListener<SendingDataCubit,SendingDataState>(
      listenWhen:(previous,current){
        return previous!=current;},
      listener: (BuildContext context, SendingDataState state) {
        if (state is SendingDataLoading){
          ImpFunctions().LoadingCircle(context);
        }
        if (state is SendingDataAccepted){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context,'/homeScreen');
        }
        if(state is SendingDataFail){
          Navigator.pop(context);
          String errorMessage =(state).errorMessage;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage),
                backgroundColor: AppColour.primaryColor,
                duration: const Duration(seconds: 5),)
          );
        }
      },
      child: Container(),);
  }

}
