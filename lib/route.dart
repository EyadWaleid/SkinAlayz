import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalayz/Business_logic/SendingData/sending_data_cubit.dart';
import 'package:skinalayz/Business_logic/forgetPassword/forget_password_cubit.dart';
import 'package:skinalayz/Business_logic/register/register_cubit.dart';
import 'package:skinalayz/presentation/HomeScreen/HomeScreen.dart';
import 'package:skinalayz/presentation/authScreen/choosescreen/chooseScreen.dart';
import 'package:skinalayz/presentation/authScreen/loginAsUser/UserLogin.dart';
import 'package:skinalayz/presentation/authScreen/loginAsUser/ForgetPasseword/forgetpasswordScreen.dart';
import 'package:skinalayz/presentation/authScreen/registerAsUser/registerAsUser.dart';
import 'package:skinalayz/presentation/authScreen/registerAsUser/userdata/userdata.dart';
import 'package:skinalayz/presentation/splashscreen/splashScreen.dart';
import 'Business_logic/login/login_form_cubit.dart';
class AppRoute {
  static Route? onGenarate(RouteSettings settings) {
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(
            builder: (_) => SizedBox(
                height: double.infinity,
                width: double.infinity,
                //this widget to check if the user has been logged to the application so if he logged before make him enter to homeScreen dirctly
                child: AnimatedSplashScreen(
                  splash: SizedBox(height: double.infinity,child: Center(child: SplashScreen())),
                  nextScreen: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      } else if (!snapshot.hasData) {
                        return  ChooseScreen();
                      } else {
                        return const HomeScreen();
                      }
                    },
                  ),
                  backgroundColor: Colors.white,
                  splashIconSize: 500,
                  duration:3000,
                )));

      case ('/userlogin'):
        return MaterialPageRoute(builder: (_) =>BlocProvider<LoginFormCubit>(create:(context) => LoginFormCubit() ,child:const UserLogin()));
      case('/forgetScreen'):
        return MaterialPageRoute(builder: (_)=>BlocProvider<ForgetPasswordCubit>(create:(context) => ForgetPasswordCubit() ,child:ForgetPasswordScreen()));
      case ('/registerUser'):
        return MaterialPageRoute(builder: (_) => BlocProvider<RegisterCubit>(create:(context) => RegisterCubit() ,child:const RegisterUser()));
      case ('/userData'):
        return MaterialPageRoute(builder: (_) => BlocProvider<SendingDataCubit>(create:(context) => SendingDataCubit() ,child: UserData()));
      case('/homeScreen'):
        return MaterialPageRoute(builder: (_)=>const HomeScreen());

    }
  }
}


