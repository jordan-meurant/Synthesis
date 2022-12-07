import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synthesis/controllers/authentication_controller.dart';
import 'package:synthesis/screens/course_screen.dart';
import 'package:synthesis/screens/home_screen.dart';
import 'package:synthesis/screens/reset_password_by_email_screen.dart';
import 'package:synthesis/screens/signup_screen.dart';
import 'package:synthesis/utils/routes.dart';
import 'package:synthesis/utils/theme.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/on_boarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        onBoardingScreen: (context) => const OnBoardingScreen(),
        registerScreen: (context) => const SignUpScreen(),
        loginScreen: (context) => const LoginScreen(),
        resetPasswordByEmailScreen: (context) =>
            const ResetPasswordByEmailScreen(),
        homeScreen: (context) => const HomeScreen(),
        courseScreen: (context) => const CourseScreen(),
      },
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      home: const CircularProgressIndicator(),
    );
  }
}
