import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalayz/common/widgets/appButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(label: 'SignOut',function: () async{
           await FirebaseAuth.instance.signOut();
           Navigator.pushNamed(context, '/userlogin');


        },),
      ),
    );
  }
}
