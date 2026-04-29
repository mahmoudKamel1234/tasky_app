// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  GestureButton({super.key, required this.text, required this.onTap});
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: .center,
        child: Text(

          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xffffffff),
            
            fontWeight: .w600,
          ),
        ),
        height: 48,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff5F33E1),
        ),
      ),
    );
  }
}
