import 'package:flutter/material.dart';
import 'package:icecreamshop/core/utils/color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.keyboardType,
    this.validator,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: AppColors.deepBlack) : null,
        labelText: label,
        filled: true,
        fillColor: AppColors.softSky,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
