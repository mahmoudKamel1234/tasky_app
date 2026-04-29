import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasky_app/screan/empty_screan.dart';

import 'package:tasky_app/screan/login_app.dart';
import 'package:tasky_app/screan/register_app.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Tassky());
}

class Tassky extends StatelessWidget {
  const Tassky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser?.uid == null
          ? LoginScreen.routeName
          : EmptyScreen.routeName,
      home: Scaffold(appBar: AppBar(title: Text("Tassky"))),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegstireScreen.routeName: (context) => RegstireScreen(),
        EmptyScreen.routeName: (context) => EmptyScreen(),
      },
    );
  }
}
