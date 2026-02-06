import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    this.height = 55,
    this.width = double.infinity,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColor.black50,
          backgroundColor: AppColor.primary50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColor.black80,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
