import 'package:final_exam/screen/home/view/home_screen.dart';
import 'package:final_exam/screen/login/view/log_in.dart';
import 'package:final_exam/screen/registration/view/sign_up.dart';
import 'package:final_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_route = {
  "/": (context) => const SplashScreen(),
  "login": (context) => const LoginPage(),
  "signup": (context) => const SignUpPage(),
  "home": (context) => const HomeScreen(),
};
