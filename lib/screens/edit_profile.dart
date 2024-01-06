import 'dart:io';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper.dart';
import 'package:ecommerce_app/firebase_helper/firebase_storage_helper.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:ecommerce_app/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;

  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('${value?.path}');
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          image == null
              ? CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: const CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.camera_alt),
                  ),
                )
              : CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(image!),
                  ),
                ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInfo.name,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              UserModel userModel = appProvider.getUserInfo.copyWith(name: nameController.text);
              appProvider.updateUserInfoFirebase(context, userModel, image);
            },
          )
        ],
      ),
    );
  }
}
