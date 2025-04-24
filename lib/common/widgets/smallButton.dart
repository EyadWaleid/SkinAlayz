import 'package:flutter/material.dart';

import '../../utli/constant/colours.dart';

class SmallButton extends StatelessWidget {
  String text;
  String image;
   SmallButton({
    super.key,
     required this.text,
     required this.image
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){},color: AppColour.backgroundColor,
      shape: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
      height: 50,
      child:  Row(
        children: [
          Text('$text   ',style: Theme.of(context).textTheme.labelLarge,),
          Image.asset(image,height: 25,width:25,),

        ],
      ),);
  }
}
