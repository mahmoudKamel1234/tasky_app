import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/error_loding.dart';
import 'package:tasky_app/auth/gesture_botton.dart';
import 'package:tasky_app/data/auth_firebase.dart';
import 'package:tasky_app/data/result_firebase.dart';
import 'package:tasky_app/data/valedator_app.dart';
import 'package:tasky_app/model/app_user.dart';
import 'package:tasky_app/screan/login_app.dart';
import 'package:tasky_app/screan/text_form_field_widget.dart';

class RegstireScreen extends StatefulWidget {
  RegstireScreen({super.key});
  static const String routeName = "RegstireScreen";
  @override
  State<RegstireScreen> createState() => _RegstireScreen();
}

class _RegstireScreen extends State<RegstireScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController name = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 100),
              Text(
                "Register",
                style: TextStyle(fontSize: 32, fontWeight: .bold),
              ),
              SizedBox(height: 60),
              TextFormFiledWidget(
                obscureText: false,
                validator: ValidatorApp.validateName,
                controller: name,
                hintText: "Please enter your name",
              ),
              SizedBox(height: 35),
              TextFormFiledWidget(
                obscureText: false,
                validator: ValidatorApp.validateEmail,
                controller: email,
                hintText: "please enter your email",
              ),
              SizedBox(height: 35),
              TextFormFiledWidget(
                obscureText: true,
                validator: ValidatorApp.validatePassword,
                controller: password,
                hintText: "please enter your password",
              ),
              SizedBox(height: 35),
              TextFormFiledWidget(
                obscureText: true,
                validator: (value) =>
                    ValidatorApp.validateConfirmPassword(value, password.text),
                controller: confirmPassword,
                hintText: "Confirm Password",
              ),
              SizedBox(height: 60),
              GestureButton(
                text: "Regstier",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    var user = AppUser(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                    );
                    await regstier(context: context, user: user);
                  } else {
                    print("null");
                  }
                },
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: "have an account?",
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(color: Color(0xff5F33E1)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(
                            context,
                          ).pushNamed(LoginScreen.routeName);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> regstier({
    required BuildContext context,
    required AppUser user,
  }) async {
    showLoadingUi(context);
    final result = await AuthFireBase.regstier(user);
    Navigator.of(context).pop();
    switch (result) {
      case Succes<AppUser>():
        Navigator.of(context).pop();

      case Erorr<AppUser>():
        showErorrLoading(context: context, erorr: result.erorr);
    }
  }
  
  void showLoadingUi(BuildContext context) {}
}
