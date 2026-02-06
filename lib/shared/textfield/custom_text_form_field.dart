import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? prefix;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color focusedBorderColor;
  final int? maxLine;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.prefix,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.focusedBorderColor = AppColor.black80,
    this.maxLine = 1,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      validator: widget.validator,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        prefixIcon: widget.prefix != null ? Icon(widget.prefix) : null,
        // prefixIconColor: AppColor.hintColor,
        filled: true,
        // fillColor: AppColor.fillColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          // color: AppColor.hintColor,
        ),
        errorStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          // color: AppColor.fireRed,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(width: 1.2, color: widget.focusedBorderColor),
        errorBorder: _border(
          width: 1.2,
          // color: AppColor.fireRed
        ),
        focusedErrorBorder: _border(
          width: 1.2,
          // color: AppColor.fireRed
        ),
        suffixIcon: widget.obscureText ? _buildVisibilityIcon() : null,
      ),
    );
  }

  Widget _buildVisibilityIcon() {
    return IconButton(
      icon: Icon(
        _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: AppColor.black50,
      ),
      onPressed: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
    );
  }

  OutlineInputBorder _border({
    double width = 1,
    Color color = AppColor.black50,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
