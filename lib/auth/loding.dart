import 'package:flutter/material.dart';

void showLoadingUi(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xfffffffff),
      content: SizedBox(
        height: 40,
        width: 40,
        child: Center(
          child: Row(
            spacing: 30,
            mainAxisAlignment: .center,
            children: [
              CircularProgressIndicator(color: Color(0xff5F33E1)),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
