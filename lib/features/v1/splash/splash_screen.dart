import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/core/constants/storage_constants.dart';
import 'package:stock_app/features/v1/login/login_screen.dart';
import 'package:stock_app/features/v1/onborading/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void init() async {
    final pref = await SharedPreferences.getInstance();
    bool isFirstTime = pref.getBool(StorageConstants.firstTime) ?? true;

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
      return;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      return;
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImage.logo)));
  }
}
