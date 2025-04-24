import 'package:flutter/material.dart';

class ImpFunctions{
  void LoadingCircle(context){
    AlertDialog alertDialog=const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
      return alertDialog;
    });

  }
}