import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/error_loding.dart';
import 'package:tasky_app/auth/gesture_botton.dart';
import 'package:tasky_app/auth/loding.dart';
import 'package:tasky_app/data/auth_firebase.dart';
import 'package:tasky_app/data/result_firebase.dart';
import 'package:tasky_app/data/valedator_app.dart';
import 'package:tasky_app/model/app_user.dart';
import 'package:tasky_app/screan/empty_screan.dart';
import 'package:tasky_app/screan/register_app.dart';
import 'package:tasky_app/screan/text_form_field_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
              Text("Login", style: TextStyle(fontSize: 32, fontWeight: .bold)),
              SizedBox(height: 60),

              TextFormFiledWidget(
                obscureText: false,
                validator: ValidatorApp.validateEmail,
                controller: email,
                hintText: "please enter your email",
              ),
              SizedBox(height: 50),
              TextFormFiledWidget(
                obscureText: true,
                validator: ValidatorApp.validatePassword,
                controller: password,
                hintText: "please enter your password",
              ),

              SizedBox(height: 60),
              GestureButton(
                text: "Next",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    var user = AppUser(
                      email: email.text,
                      password: password.text,
                    );
                    await login(context: context, user: user);
                  }
                },
              ),
              SizedBox(height: 20),

              Text.rich(
                TextSpan(
                  text: "Not have an account?",
                  children: [
                    TextSpan(
                      text: "Regstier",
                      style: TextStyle(color: Color(0xff5F33E1)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(
                            context,
                          ).pushNamed(RegstireScreen.routeName);
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

  Future<void> login({
    required BuildContext context,
    required AppUser user,
  }) async {
    showLoadingUi(context);
    final result = await AuthFireBase.login(
      email: user.email!,
      password: user.password!,
      user: user,
    );
    Navigator.of(context).pop();

    switch (result) {
      case Succes<bool>():
        Navigator.of(context).pushNamed(EmptyScreen.routeName);
      case Erorr<bool>():
        showErorrLoading(context: context, erorr: result.erorr);
    }
  }
}
