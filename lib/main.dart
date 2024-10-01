import 'package:flutter/material.dart';
import 'package:seller_app/authScreens/signin_screen.dart';
import 'package:seller_app/authScreens/signup_screen.dart';
import 'package:seller_app/onboardingScreen/onboarding_screen.dart';
import 'package:seller_app/launchScreen/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masterpiece Vendors/Workers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const LaunchScreen(),
      //   '/onboarding': (context) => const OnboardingScreen(),
      //   '/login': (context) => const SigninScreen(),
      // },
      home: SignupScreen(),
    );
  }
}
