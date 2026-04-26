import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasky_app/screan/home_screan.dart';
import 'package:tasky_app/screan/login_app.dart';
import 'package:tasky_app/screan/register_app.dart';import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: LoginApp.routeName,
     routes: {
        LoginApp.routeName: (context) => LoginApp()
        ,RegisterApp.routeName: (context) => RegisterApp(),
       HomeScrean.routeName: (context) => HomeScrean(),
      },
     
    );
  }
}
