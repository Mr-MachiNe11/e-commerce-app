import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/screens/auth_ui/login.dart';
import 'package:ecommerce_app/screens/auth_ui/sign_up.dart';
import 'package:ecommerce_app/widgets/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_images.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitles(
              title: 'Welcome', subtitle: 'Buy any item from using App'),
          const SizedBox(
            height: 30,
          ),
          Center(child: Image.asset(AssetsImages.instance.welcomeImage)),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.facebook,
                color: Colors.blue,
                size: 35,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                AssetsImages.instance.googleLogo,
                scale: 6,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            title: 'Login',
            onPressed: () {
              Routes.instance.push(const Login(), context);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          PrimaryButton(
            title: 'Sign up',
            onPressed: () {
              Routes.instance.push(const SignUp(), context);
            },
          ),
        ],
      ),
    ));
  }
}
