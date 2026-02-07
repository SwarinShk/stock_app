import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/features/v1/splash/splash_screen.dart';
import 'package:stock_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imaji Stock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.white),
        fontFamily: 'Inter',
      ),
      home: SplashScreen(),
    );
  }
}
