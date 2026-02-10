import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_image.dart';
import 'package:stock_app/core/constants/app_text_style.dart';
import 'package:stock_app/core/constants/app_validator.dart';
import 'package:stock_app/features/v1/dashboard/dashboard_screen.dart';
import 'package:stock_app/features/v1/signup/signup_screen.dart';
import 'package:stock_app/providers/auth_service_provider.dart';
import 'package:stock_app/shared/appbar/custom_appbar.dart';
import 'package:stock_app/shared/button/custom_button.dart';
import 'package:stock_app/shared/button/custom_labeled_icon_button.dart';
import 'package:stock_app/shared/card/labeled_field.dart';
import 'package:stock_app/shared/textfield/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authServiceProvider = context.watch<AuthServiceProvider>();
    return Scaffold(
      appBar: CustomAppbar(title: Image.asset(AppImage.appBarLogo)),
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
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      SizedBox(height: 30),
                      Text('Welcome Back 👋', style: AppTextStyle.heading3),
                      SizedBox(height: 28),
                      Text(
                        'Today is a new trading day. Stay informed, track the market, and manage your investments with confidence.',
                        style: AppTextStyle.regular,
                      ),
                      SizedBox(height: 50),
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
                      SizedBox(height: 20),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.black50,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyle.semibold.copyWith(
                              fontSize: 14,
                              color: AppColor.secondary50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        title: 'Sign In',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await authServiceProvider
                                .signInUser(
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
                            'Or sign in with',
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
                      Center(
                        child: RichText(
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
                                  fontSize: 14,
                                  color: AppColor.black80,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
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
