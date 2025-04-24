import 'package:flutter/material.dart';
import 'package:skinalayz/utli/constant/colours.dart';



class AppButton extends StatelessWidget {
  String label;
  Color? color;
  double?width;

  void Function()? function;
   AppButton({super.key,required this.label,this.color,this.function,this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width??400,
        child: MaterialButton(
            onPressed:function??(){

            },
            padding: const EdgeInsets.symmetric(vertical: 15),
            elevation: 1.5,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
          color: color??AppColour.primaryColor,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
            ),

        )) ;
  }
}