import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/features/v1/login/login_screen.dart';
import 'package:stock_app/providers/auth_service_provider.dart';
import 'package:stock_app/shared/appbar/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authServiceProvider = context.watch<AuthServiceProvider>();

    return Scaffold(
      appBar: CustomAppbar(
        title: Image.asset(AppImage.appBarLogo),
        actions: [
          IconButton(
            onPressed: () async {
              final success = await authServiceProvider.signOut();
              if (success && context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Dashboard Screen')),
    );
  }
}
