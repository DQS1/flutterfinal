import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.labelText,
      required this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration:  InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: validator,
    );
  }
}
