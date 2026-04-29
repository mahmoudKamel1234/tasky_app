import 'package:flutter/material.dart';
import 'package:tasky_app/auth/botton_show.dart';
import 'package:tasky_app/ui/color.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EmptyScreen());
  }
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});
  static const String routeName = "EmptyScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/images/tassky_image.png")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .start,
            spacing: 10,
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/undraw_push-notifications_5z1s 1.png"),
              Text(
                "What do you want to do today?",
                style: TextStyle(fontSize: 20),
              ),
              Text("Tap + to add your tasks", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.bottomColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => CustomShowBottonSheet(),
          );
        },
        child: Icon(Icons.add, size: 45, color: AppColor.primaryColor),
      ),
    );
  }
}
