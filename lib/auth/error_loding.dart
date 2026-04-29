import 'package:flutter/material.dart';

void showErorrLoading({required BuildContext context, required String erorr}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xfffffffff),
      title: Text("Erorr"),
      content: Text(erorr, style: TextStyle(fontSize: 25)),
    ),
  );
}
