import 'package:flutter/material.dart';

import '../../utli/constant/colours.dart';


class TTextButton extends StatelessWidget {
  String label;
  Color? color;
  bool atEnd;
 void Function()? function;

  TTextButton({super.key, required this.label, this.color,this.function,this.atEnd=false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function??(){

      },
      child: Text(label,
          style: Theme.of(context)
              .textTheme
              .labelLarge,),
    );
  }
}
