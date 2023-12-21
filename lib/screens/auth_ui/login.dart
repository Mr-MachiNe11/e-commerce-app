import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/firebase_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/screens/auth_ui/sign_up.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/widgets/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isShowPassword = true;
  bool loading = false;
  //final _formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;

  /*@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });

    _auth
        .signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString())
        .then((value) {
      showMessage(value.user!.email.toString());
      setState(() {
        loading = false;
      });
      *//*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostScreen(),
          ));*//*
    }).onError((error, stackTrace) {
      showMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(
                    title: 'Login', subtitle: 'Welcome back to our E-commerce App'),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
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

                  title: 'Login',
                    onPressed: () async {
                      bool isValidated = loginValidation(
                          emailController.text.toString(), passwordController.text.toString());
                      if (isValidated) {
                        bool isLogined = await FirebaseAuthHelper.instance.login(
                            emailController.text.toString(), passwordController.text.toString(), context);
                        if (isLogined) {
                          Routes.instance.pushAndRemoveUntil(const Home(), context);
                        }
                      }
                    }
                ),
                const SizedBox(
                  height: 24,
                ),
                const Center(child: Text("Don't have an account?")),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Routes.instance.push(const SignUp(), context);
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


