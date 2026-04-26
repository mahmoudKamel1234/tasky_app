import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.validator,
  });
   TextEditingController? controller;
   String? hintText;
   TextStyle? hintStyle;
   String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff808080),
            ),
        fillColor: const Color(0xfff9e9e9),
        filled: true,
        focusedBorder: _outlineInputBorder(const Color(0xffff3951)),
        enabledBorder: _outlineInputBorder(Colors.transparent),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
      
    );
  }
}
