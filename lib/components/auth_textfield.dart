import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String placeholder;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.placeholder,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
     
        decoration: InputDecoration(
            labelText: placeholder,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(0xFFE9E9E9),),
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),

              borderSide: BorderSide(color: Color(0xFFE9E9E9),),
            ),
            isDense: true,
            fillColor: const Color(0xFFE9E9E9),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFE9E9E9),)),
      ),
    );
  }
}