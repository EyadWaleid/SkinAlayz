import 'package:flutter/material.dart';
import 'package:skinalayz/utli/constant/images.dart';

class  SplashScreen extends StatelessWidget {
   SplashScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(AppImage.logo),
            Text('SkinAlyze',style: Theme.of(context).textTheme.headlineLarge,),
            Text('Your Personal AI Dermatologist ',style: Theme.of(context).textTheme.labelMedium,maxLines:2,textAlign: TextAlign.center,),
            Text(' Early Detection Matters! ',style: Theme.of(context).textTheme.labelMedium,maxLines:2,textAlign: TextAlign.center,),]
        ),
      );
  }
}
