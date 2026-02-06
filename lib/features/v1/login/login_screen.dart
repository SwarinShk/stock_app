import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/core/constants/app_text_style.dart';
import 'package:stock_app/shared/appbar/custom_appbar.dart';
import 'package:stock_app/shared/button/custom_button.dart';
import 'package:stock_app/shared/textfield/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Image.asset(AppImage.appBarLogo)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black80,
                ),
              ),
              SizedBox(height: 30),
              CustomTextFormField(hintText: 'Email'),
              SizedBox(height: 15),
              CustomTextFormField(hintText: 'Password', obscureText: true),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(title: 'Sign In', onPressed: () {}),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.regular.copyWith(
                    fontSize: 14,
                    color: AppColor.black50,
                  ),
                  children: [
                    TextSpan(text: 'Don\'t you have an account?'),
                    TextSpan(text: '  '),
                    TextSpan(
                      text: 'Sign Up',
                      style: AppTextStyle.regular.copyWith(
                        color: AppColor.black80,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
