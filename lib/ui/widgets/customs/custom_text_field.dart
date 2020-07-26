import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final EdgeInsets padding;
  final int lines;
  final bool secure;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const CustomTextField(
      {Key key,
      this.secure = false,
      this.padding = const EdgeInsets.all(10),
      this.controller,
      this.hint,
      this.lines = 1,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        maxLines: lines,
        keyboardType: keyboardType,
        obscureText: secure,
        controller: controller,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 0.0, color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 0.0, color: Colors.white),
            )),
      ),
    );
  }
}
