import 'package:flutter/material.dart';

class StateUserAuth extends StatelessWidget {
  StateUserAuth({super.key,required this.title,required this.subTitle,this.onTap});
  String title;
  String subTitle;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
          children: [
            TextSpan(
              text: subTitle,
              style: TextStyle(color: Color(0xff5F33E1)),
            ),
          ],
        ),
      ),
    );
  }
}
