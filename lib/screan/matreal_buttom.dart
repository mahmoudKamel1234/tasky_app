import 'package:flutter/material.dart';

class MatrealButtomApp extends StatelessWidget {
  MatrealButtomApp({super.key,required this.lable,this.onPressed});
  String lable;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color:Color(0xff5F33E1),
      height: 48,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: Text(
        lable,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
