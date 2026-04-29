import 'package:flutter/material.dart';


class TextFormFiledWidget extends StatelessWidget {
  TextFormFiledWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
  });
  String? hintText;
  late bool obscureText;
  String? Function(String?)? validator;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        filled: true,
        fillColor: Color(0xffEAEAEA),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
