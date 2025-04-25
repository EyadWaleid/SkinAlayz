import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/Business_logic/login/login_form_cubit.dart';
import 'package:skinalayz/common/functions/functions.dart';
import 'package:skinalayz/common/widgets/TTextButton.dart';
import '../../../common/widgets/TextField.dart';
import '../../../common/widgets/appButton.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String? emailValidation(String? email){
    RegExp emailRegex=RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$') ;
    final isEmailvalid=emailRegex.hasMatch(email??"");
    if(!isEmailvalid){
      return 'Enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
        key: formKey,
        child: Column(
          children: [
            FormBox(
              labeled: 'Email',
              icon: Icons.email,
              isFilled: true,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,validator:  emailValidation,),
            const SizedBox(height: 10,),

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
                        return 'least number of characters for password is 6 ';
                      }}
                  },);
              },
            ),
            Row(
              children: [
                const Spacer(),
                TTextButton(label:'Forget password',function: () {
                  Navigator.pushReplacementNamed(context, '/forgetScreen');


                }, ),
              ],
            ),
            const SizedBox(height: 10,),
            AppButton(label: 'Login',function: (){
              ImpFunctions().LoadingCircle(context);
             if( !formKey.currentState!.validate()){
               Navigator.pop(context);
               return;}
               else{
                 Navigator.pop(context);
               BlocProvider.of<LoginFormCubit>(context).login(emailAddress: emailController.text, password: passwordController.text);
             }
            },),
            BlocListener<LoginFormCubit,LoginFormState>(
            listenWhen:(previous,current){
              return previous!=current;},
              listener: (BuildContext context, LoginFormState state) {
              if (state is LoadingForm){
                ImpFunctions().LoadingCircle(context);
              }
               if (state is LoginAccepted){
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context,'/homeScreen');
              }
               if(state is LoginFail){
                Navigator.pop(context);
                String errorMessage =(state).errorMesseage;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage),
                  backgroundColor: Colors.black,
                  duration: const Duration(seconds: 5),)
                );
              }
            },
            child: Container(),),

          ],
        ),
      );}
  ValueNotifier <bool> isAppeare=ValueNotifier(true);

}


