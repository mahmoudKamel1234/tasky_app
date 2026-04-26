import 'package:flutter/material.dart';

abstract class DialogApp {
   static void showLoadingUi(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xffffffff),
        content: SizedBox(
          height: 40,
          width: 40,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Color(0xff5F33E1)),
                const SizedBox(width: 30),
                Text(
                  "Loading...",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff252525),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   static void showErrorUI({required BuildContext context, required String error}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xffffffff),
        title: const Text("Error"),
        content: Text(
          error,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

}