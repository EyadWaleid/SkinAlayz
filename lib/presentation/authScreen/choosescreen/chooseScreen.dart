import 'package:flutter/material.dart';
import 'package:skinalayz/utli/constant/colours.dart';
import 'package:skinalayz/utli/constant/images.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImage.logo),
              Text(
                'Who are you?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'select your role to continue',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColour.primaryColor.withOpacity(0.5)),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      AppImage.chooseImage,
                    ),
                    Positioned(
                      top: 160,
                      child: Row(
                        children: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/userlogin');
                              },
                              color: AppColour.primaryColor,
                              height: 50,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              child: Text(
                                'User',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.white),
                              )),
                          const SizedBox(
                            width: 170,
                          ),
                          MaterialButton(
                              onPressed: () {},
                              color: AppColour.primaryColor,
                              height: 50,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              child: Text(
                                'Doctor',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
