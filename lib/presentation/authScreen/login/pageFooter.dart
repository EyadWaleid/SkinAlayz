import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/TTextButton.dart';
import '../../../utli/constant/colours.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 150,
            child: Divider(
              color: AppColour.primaryColor,
              thickness: 1,
            ),
          ),
        ),
        Center(child: Text("you don't have account?",style: Theme.of(context).textTheme.labelMedium,)),
        Center(
          child: TTextButton(label: 'Register',function: () {
            Navigator.pushNamed(context, '/registerUser');
          },),
        )
      ],
    );
  }
}
