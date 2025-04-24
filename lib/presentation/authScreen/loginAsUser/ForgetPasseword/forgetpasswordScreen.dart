import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/Business_logic/forgetPassword/forget_password_cubit.dart';
import 'package:skinalayz/common/widgets/TextField.dart';
import 'package:skinalayz/common/widgets/appButton.dart';
import 'package:skinalayz/utli/constant/images.dart';

import '../../../../common/functions/functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  TextEditingController emailVertification=TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppImage.logo)),
                Text('Reset password ',style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.start,),
                const SizedBox(height:10,),
                FormBox(labeled: 'Email', icon: Icons.email, controller:emailVertification,isFilled: true, ),
                const SizedBox(height: 50,),

                AppButton(label: 'Send Link',function: (){
                  ImpFunctions().LoadingCircle(context);

                  if(!formKey.currentState!.validate()){
                    Navigator.pop(context);
                  }
                  else {
                    Navigator.pop(context);
                    BlocProvider.of<ForgetPasswordCubit>(context).sendLink(email:emailVertification.text);
                  }
                },),
                BlocListener<ForgetPasswordCubit,ForgetPasswordState>(
                  listenWhen:(previous,current){
                    return previous!=current;},
                  listener: (BuildContext context, ForgetPasswordState state) {
                    if (state is ForgetPasswordLoading){
                      ImpFunctions().LoadingCircle(context);
                    }
                    if (state is ForgetPasswordAccept){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('The rest link send to the mail '),
                            backgroundColor: Colors.black,
                            duration: Duration(seconds: 10),)
                      );
                      Navigator.pushReplacementNamed(context,'/userlogin');
                    }
                    if(state is ForgetPasswordError){
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
          ),
        ),
      ) ,
    );
  }
}
