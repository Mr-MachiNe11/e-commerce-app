import 'dart:io';

import 'package:ecommerce_app/firebase_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/widgets/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/theme.dart';
import 'screens/auth_ui/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBXa_Iz6tAunPt8Ll3uMWv1NJYy43ZMpOk',
              appId: '1:875000428969:android:e10aafb775b187afa8ecb8',
              messagingSenderId: '875000428969',
              projectId: 'e-commerce-58a4c'),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: themeData,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const BottomBar();
              }
              return const Welcome();
            }),
      ),
    );
  }
}
