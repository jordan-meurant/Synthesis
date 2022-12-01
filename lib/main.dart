import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthesis/features/authentication/screens/reset_password/reset_password_by_email_screen.dart';
import 'package:synthesis/features/group/course_screen.dart';
import 'package:synthesis/features/group/home_screen.dart';
import 'package:synthesis/register.dart';
import 'package:synthesis/utils/routes.dart';
import 'package:synthesis/utils/theme.dart';

import 'features/authentication/screens/login/login_screen.dart';
import 'features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: onBoardingScreen,
      routes: {
        onBoardingScreen: (context) => const OnBoardingScreen(),
        registerScreen: (context) => const Register(),
        loginScreen: (context) => const LoginScreen(),
        resetPasswordByEmailScreen: (context) => const ResetPasswordByEmailScreen(),
        homeScreen: (context) => const HomeScreen(),
        courseScreen: (context) => const CourseScreen(),
      },
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

