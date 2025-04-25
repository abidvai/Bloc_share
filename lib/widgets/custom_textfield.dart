
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final Icon? icon;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController controller;

  const CustomTextField({

    required this.hinText,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isDense: true
      ),
    );
  }
}