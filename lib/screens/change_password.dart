import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/firebase_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Change Password',
            style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: newPasswordController,
            obscureText: isShowPassword,
            decoration: InputDecoration(
                hintText: 'New Password',
                prefixIcon: const Icon(Icons.password_sharp),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: Icon(
                      isShowPassword ? Icons.visibility : Icons.visibility_off),
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: confirmPasswordController,
            obscureText: isShowPassword,
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.password_sharp),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: Icon(
                      isShowPassword ? Icons.visibility : Icons.visibility_off),
                )),
          ),
          const SizedBox(
            height: 36,
          ),
          PrimaryButton(
            title: 'Update',
            onPressed: () async {
              if (newPasswordController.text.isEmpty) {
                showMessage('New password is empty');
              } else if (confirmPasswordController.text.isEmpty) {
                showMessage('Confirm password is empty');
              } else {
                if (confirmPasswordController.text ==
                    newPasswordController.text) {
                  FirebaseAuthHelper.instance
                      .changePassword(newPasswordController.text, context);
                } else {
                  showMessage('Confirm password did not matched');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
