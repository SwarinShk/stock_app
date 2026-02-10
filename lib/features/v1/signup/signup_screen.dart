import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/core/constants/app_text_style.dart';
import 'package:stock_app/core/constants/app_validator.dart';
import 'package:stock_app/features/v1/dashboard/dashboard_screen.dart';
import 'package:stock_app/providers/auth_service_provider.dart';
import 'package:stock_app/shared/appbar/custom_appbar.dart';
import 'package:stock_app/shared/button/custom_button.dart';
import 'package:stock_app/shared/button/custom_labeled_icon_button.dart';
import 'package:stock_app/shared/card/labeled_field.dart';
import 'package:stock_app/shared/textfield/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authServiceProvider = context.watch<AuthServiceProvider>();
    return Scaffold(
      appBar: CustomAppbar(
        leading: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        title: Image.asset(AppImage.appBarLogo),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      SizedBox(height: 30),
                      Text('Sign Up', style: AppTextStyle.heading3),
                      SizedBox(height: 50),
                      LabeledField(
                        label: 'Name',
                        child: CustomTextFormField(
                          controller: _nameController,
                          hintText: 'Please enter your name',
                          validator: AppValidator.validateName,
                        ),
                      ),
                      SizedBox(height: 15),
                      LabeledField(
                        label: 'Email',
                        child: CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Please enter your email',
                          validator: AppValidator.validateEmail,
                        ),
                      ),
                      SizedBox(height: 15),
                      LabeledField(
                        label: 'Password',
                        child: CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Please enter your password',
                          obscureText: true,
                          validator: AppValidator.validatePassword,
                        ),
                      ),
                      SizedBox(height: 15),
                      LabeledField(
                        label: 'Confirm Password',
                        child: CustomTextFormField(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm your password',
                          obscureText: true,
                          validator: (_) =>
                              AppValidator.validateConfirmPassword(
                                value: _passwordController.text,
                                password: _confirmPasswordController.text,
                              ),
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        title: 'Sign Up',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await authServiceProvider
                                .signUpUser(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                            if (success && context.mounted) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => DashboardScreen(),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        spacing: 15,
                        children: [
                          Expanded(child: Divider(color: AppColor.black20)),
                          Text(
                            'Or sign up with',
                            style: AppTextStyle.regular.copyWith(fontSize: 14),
                          ),
                          Expanded(child: Divider(color: AppColor.black20)),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        spacing: 15,
                        children: [
                          Expanded(
                            child: CustomLabeledIconButton(
                              icon: Icons.g_translate_outlined,
                              label: 'Google',
                              // onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: CustomLabeledIconButton(
                              icon: Icons.facebook_outlined,
                              label: 'Facebook',
                              // onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          style: AppTextStyle.regular.copyWith(
                            fontSize: 14,
                            color: AppColor.black50,
                          ),
                          children: [
                            TextSpan(text: 'Already have an account?'),
                            TextSpan(text: '  '),
                            TextSpan(
                              text: 'Sign In',
                              style: AppTextStyle.regular.copyWith(
                                fontSize: 14,
                                color: AppColor.black80,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
