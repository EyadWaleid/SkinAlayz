import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utli/constant/colours.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Divider(
            color: AppColour.primaryColor,
            thickness: 1,
          ),
        ),
        const SizedBox(width:4,),
        Text('Or',style: Theme.of(context).textTheme.labelMedium,),
        const SizedBox(width:4,),

        SizedBox(
          width: 100,
          child: Divider(
            color: AppColour.primaryColor,
            thickness: 1,
          ),
        ),


      ],
    );
  }
}
