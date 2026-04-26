import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/dailog_app.dart';
import 'package:tasky_app/auth/state_user_auth.dart';
import 'package:tasky_app/screan/matreal_buttom.dart';
import 'package:tasky_app/screan/text_form_field_widget.dart';

class RegisterApp extends StatelessWidget {
  RegisterApp({super.key});
  static const String routeName = "RegisterApp";
  var email = TextEditingController();

  var password = TextEditingController();

  var phone = TextEditingController();

  var fullName = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff252525),
                  ),
                ),
                Text(
                  "by creating a free account.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff252525),
                  ),
                  textAlign: .center,
                ),
                SizedBox(height: 44),
                Text(
                  "Full Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252525),
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: fullName,
                  hintText: "Enter your full name",
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252525),
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: email,
                  hintText: "Enter your email",
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252525),
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: phone,
                  hintText: "Enter your phone",
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252525),
                  ),
                ),
                SizedBox(height: 5),

                TextFormFieldWidget(
                  controller: password,
                  hintText: "Enter your password",
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          children: [
            MatrealButtomApp(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  register( email: email.text, password: password.text, context: context);
                }
                // showLoadingUi(context);
                // showErrorUI(context: context, error: "This is error ");
              },
              lable: 'Register',
            ),
            StateUserAuth(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: 'Already a member?',
              subTitle: 'Login in',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void register({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    DialogApp.showLoadingUi(context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogApp.showErrorUI(context: context, error: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DialogApp.showErrorUI(context: context, error: 'The account already exists for that email.');
      }
    } catch (e) {
     DialogApp.showErrorUI(context: context, error: 'An error occurred. Please try again.');
    }
  }


}
