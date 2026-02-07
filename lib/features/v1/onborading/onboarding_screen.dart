import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/core/constants/storage_constants.dart';
import 'package:stock_app/features/v1/login/login_screen.dart';
import 'package:stock_app/shared/button/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _onPressed() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(StorageConstants.firstTime, false);
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(AppImage.logo, fit: BoxFit.contain),
                    const SizedBox(height: 80),
                    Image.asset(AppImage.card, fit: BoxFit.contain),
                    const SizedBox(height: 50),
                    const Text(
                      'Easy Stock Investment\nFor Beginners',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Screening feature to filter stocks to maximize profits.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black50,
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      title: 'Let\'s Get Started',
                      onPressed: _onPressed,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
