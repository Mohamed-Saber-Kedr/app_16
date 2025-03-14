import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.controller,
        required this.textInputType,
        required this.validator,
        required this.label,
        required this.hintText});

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          suffix: IconButton(onPressed: controller.clear, icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}