import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/presentation/authScreen/registerAsUser/userdata/userdata.dart';
import 'package:skinalayz/utli/constant/colours.dart';

import '../../../Business_logic/SendingData/sending_data_cubit.dart';
import '../../../Business_logic/register/register_cubit.dart';
import '../../../common/functions/functions.dart';
import '../../../common/widgets/TextField.dart';
import '../../../common/widgets/appButton.dart';

class RegisterForm extends StatelessWidget {

  ValueNotifier<bool>isAppeareConfirm=ValueNotifier(true);

  ValueNotifier<bool>isAppeare=ValueNotifier(true);
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String? emailValidation(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$');
    final isEmailvalid = emailRegex.hasMatch(email ?? "");
    if (!isEmailvalid) {
      return 'Enter a valid email';
    }
    return null;
  }

  @override

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override

@override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormBox(
            labeled: 'Name',
            icon: Icons.person,
            isFilled: true,
            controller: nameController,
            validator: (name) {
              if (name!.isEmpty) {
                return 'enter your name  ';
              }
            },
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 10,
          ),
          FormBox(
            labeled: 'Email',
            icon: Icons.email,
            isFilled: true,
            controller: emailController,
            validator: emailValidation,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
            valueListenable:isAppeare ,
            builder: (context, value, child) {
              return FormBox(labeled: 'Password',
                isFilled: true,
                isObscured: isAppeare.value ,
                onPressed: (){
                  isAppeare.value = ! isAppeare.value;
                },
                suffixIcon: Icon(
                  isAppeare.value ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                ),
                icon: Icons.password,
                controller:passwordController,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your password ';
                  }
                  if(value.isNotEmpty){
                    if (value.length<6){
                      return 'least number of characters for password is 4 ';
                    }}
                },);
            },
          ),

          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: isAppeareConfirm,
            builder: (BuildContext context, value, Widget? child) {
              return FormBox(

              labeled: 'Confirm Password',
              isObscured: isAppeareConfirm.value,
              isFilled: true,
              onPressed: (){
                isAppeareConfirm.value=!isAppeareConfirm.value;
                print('hello');
              },
              suffixIcon:Icon(
                isAppeareConfirm.value ?  Icons.remove_red_eye_outlined:Icons.remove_red_eye ,
              ),
              icon: Icons.password,
              controller: confirmPasswordController,
              validator: (confirmPassword) {
                if (confirmPassword!.isEmpty) {
                  return 'confirm your password   ';
                } else if (confirmPassword != passwordController.text) {
                  return 'your password should be the same ';
                }
              },
            ) ; },
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            label: 'Create',
            function: () {
              ImpFunctions().LoadingCircle(context);
              if (!formKey.currentState!.validate()) {
                Navigator.pop(context);
              }

              else{
                BlocProvider.of<RegisterCubit>(context).sendEmailandPassword(emailAddress: emailController.text, password: passwordController.text);
                Navigator.push(context,MaterialPageRoute(builder:(context) => BlocProvider<SendingDataCubit>(create:(context) => SendingDataCubit() ,child:UserData(email: emailController.text, name: nameController.text, ))));
              }
            },

          ),


        ],
      ),
    );
  }

  BlocListener<RegisterCubit, RegisterState> _stateListenner() {
    return BlocListener<RegisterCubit,RegisterState>(
          listenWhen:(previous,current){
            return previous!=current;},
          listener: (BuildContext context, RegisterState state) {
            if (state is RegisterLoading){
              ImpFunctions().LoadingCircle(context);
            }
            if (state is RegisterAccepted){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context,'/userData');
            }
            if(state is RegisterRejected){
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
