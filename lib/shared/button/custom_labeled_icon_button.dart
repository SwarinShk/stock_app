import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_text_style.dart';

class CustomLabeledIconButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final String label;
  final void Function()? onPressed;

  const CustomLabeledIconButton({
    super.key,
    this.height = 55,
    this.width = double.infinity,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColor.black50,
          backgroundColor: AppColor.white,
          disabledBackgroundColor: AppColor.black20,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.primary50, width: 1.5),
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: AppTextStyle.semibold),
      ),
    );
  }
}
