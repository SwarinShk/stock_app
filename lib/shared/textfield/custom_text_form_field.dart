import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_color.dart';
import 'package:stock_app/core/constants/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? prefix;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
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
        prefixIconColor: AppColor.black50,
        filled: true,
        fillColor: AppColor.black20,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.regular.copyWith(
          color: AppColor.black50,
          fontSize: 14,
        ),
        errorStyle: AppTextStyle.regular.copyWith(
          fontSize: 12,
          color: AppColor.secondary50,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(color: AppColor.black40),
        errorBorder: _border(color: AppColor.secondary50),
        focusedErrorBorder: _border(color: AppColor.secondary50),
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

  OutlineInputBorder _border({double width = 1, Color color = AppColor.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
