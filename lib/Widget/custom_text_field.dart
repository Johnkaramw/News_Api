import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final String? Function(String?)? validator; // إضافة validator

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.validator, // إضافة validator كمعامل
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField( // استخدام TextFormField بدلاً من TextField
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      obscureText: isPassword,
      keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
      validator: validator, // استخدام validator هنا
    );
  }
}
