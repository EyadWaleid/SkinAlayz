import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/Business_logic/login/login_form_cubit.dart';
import 'package:skinalayz/common/widgets/TTextButton.dart';
import 'package:skinalayz/common/widgets/TextField.dart';
import 'package:skinalayz/common/widgets/appButton.dart';
import 'package:skinalayz/presentation/authScreen/loginAsUser/pageFooter.dart';
import 'package:skinalayz/utli/constant/colours.dart';
import 'package:skinalayz/utli/constant/images.dart';

import '../../../common/widgets/smallButton.dart';
import '../OrWidget.dart';
import 'loginform.dart';

class UserLogin extends StatelessWidget {
  const UserLogin ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // The start of the page icon and 2 text
                Center(child: Image.asset(AppImage.logo)),
                 Text('Welcome Back!',style: Theme.of(context).textTheme.titleLarge,),
                 Text('Login with your account',style: Theme.of(context).textTheme.labelMedium,),
                const SizedBox(height:10,),
               //the form Widgets
               LoginForm(),
                const SizedBox(height: 20,),
                //the divider and or
                const OrWidget(),
                const SizedBox(height: 20,),
                //the buttons of google and outlook
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SmallButton(text: 'Login with', image: 'assets/images/google (1).png',),
                    const SizedBox(width: 20,),
                    SmallButton(text: 'Login with', image: 'assets/images/outlook.png',),
        
        
                  ],
                ),
                const SizedBox(height: 20,),
                //the divider and register button
                PageFooter()

              ],
            ),
          ),
        ),
      ),
    );
  }
}




