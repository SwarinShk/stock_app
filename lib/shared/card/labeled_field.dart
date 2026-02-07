import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_text_style.dart';

class LabeledField extends StatelessWidget {
  const LabeledField({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.regular.copyWith(fontSize: 14)),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
