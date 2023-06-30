import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/features/auth/presentation/pages/login_page.dart';
import 'package:weather_app/core/injection_container.dart' as di;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.startup();
  runZonedGuarded(() async {

  }, (error, stack) { });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.appColor,
          primarySwatch: AppColors.appColor,
        useMaterial3: false,
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              focusColor: AppColors.appColor,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.appColor)),),
        elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: AppUI.borderRadius2))),
        textTheme: Theme.of(context).textTheme.copyWith(
          titleLarge: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 28),
          titleSmall: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
          bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
        )
      ),
      home: const LoginPage()
    );
  }
}
