import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  MyTextField({
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          ))),
    );
  }
}
