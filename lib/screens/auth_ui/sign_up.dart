import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/widgets/bottom_bar.dart';
import 'package:ecommerce_app/widgets/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../firebase_helper/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  title: 'Create Account',
                  subtitle: 'Welcome to our E-commerce App'),
              const SizedBox(
                height: 48,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password_sharp),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                          print(isShowPassword);
                        });
                      },
                      child: Icon(isShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )),
              ),
              const SizedBox(
                height: 36,
              ),
              PrimaryButton(
                  title: 'Create an account',
                  onPressed: () async {
                    bool isValidated = signupValidation(
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        nameController.text.toString(),
                        phoneController.text.toString());
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance.signUp(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          context);
                      if (isLogined) {
                        Routes.instance
                            .pushAndRemoveUntil(const BottomBar(), context);
                      }
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              const Center(child: Text("Already have an account?")),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
