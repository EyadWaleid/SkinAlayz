import 'package:flutter/material.dart';
import 'package:skinalayz/presentation/authScreen/OrWidget.dart';
import 'package:skinalayz/presentation/authScreen/registerAsUser/registerBody.dart';
import '../../../common/widgets/TTextButton.dart';
import '../../../common/widgets/smallButton.dart';
import '../../../utli/constant/colours.dart';
import '../../../utli/constant/images.dart';
class RegisterUser extends StatelessWidget {
  const RegisterUser({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImage.logo)),
                Text(
                  'Create account!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'create to start your diagnose ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                RegisterForm(),
                const SizedBox(
                  height: 20,
                ),
                const OrWidget(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(
                      text: 'register with',
                      image: 'assets/images/google (1).png',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SmallButton(
                      text: 'register with',
                      image: 'assets/images/outlook.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: Divider(
                      color: AppColour.primaryColor,
                      thickness: 1,
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  "you have account?",
                  style: Theme.of(context).textTheme.labelMedium,
                )),
                Center(
                  child: TTextButton(
                    label: 'Login',
                    function: () {
                      Navigator.pushNamed(context, '/userlogin');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
