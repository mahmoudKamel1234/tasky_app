import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/dailog_app.dart';
import 'package:tasky_app/auth/state_user_auth.dart';
import 'package:tasky_app/screan/matreal_buttom.dart';
import 'package:tasky_app/screan/register_app.dart';
import 'package:tasky_app/screan/text_form_field_widget.dart';

class LoginApp extends StatelessWidget {
  LoginApp({super.key});
static const String routeName = "LoginApp";
  var email = TextEditingController();

  var password = TextEditingController();

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
                
                SizedBox(height: 80),
                Text(
                  " login",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff252525),
                  ),
                ),
                Text(
                  "sign in to access your account",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff252525),
                  ),
                  textAlign: .center,
                ),
                SizedBox(height: 100),
            
            Text("Email",
            style: TextStyle(fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff252525)),),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: email,
                  hintText: "Enter your email",
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                ),
                SizedBox(height: 30),
            
            Text("Password",
            style: TextStyle(fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff252525)),),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: password,
                  hintText: "Enter your password",
                 validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  login(
                    email: email.text,
                    password: password.text,
                    context: context,
                  );
                }
              },
              lable: 'LOGIN',
            ),
            StateUserAuth(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => RegisterApp()));
              },
              title: 'New member ?',
              subTitle: 'Register now',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    DialogApp.showLoadingUi(context);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'user-not-found') {
        DialogApp.showErrorUI(context: context, error: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        DialogApp.showErrorUI(context: context, error: 'Wrong password provided for that user.');
      }
     else {
        DialogApp.showErrorUI(context: context, error: 'An error occurred. Please try again.');
      }
    } catch (e) {
      DialogApp.showErrorUI(context: context, error: 'An error occurred. Please try again.');
    }
  }
}
