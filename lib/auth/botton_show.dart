import 'package:flutter/material.dart';
import 'package:tasky_app/auth/perortiy.dart';
import 'package:tasky_app/data/valedator_app.dart';
import 'package:tasky_app/screan/text_form_field_widget.dart';
import 'package:tasky_app/ui/icon.dart';


class CustomShowBottonSheet extends StatefulWidget {
  CustomShowBottonSheet({super.key});
  @override
  State<CustomShowBottonSheet> createState() => _ShowBottonSheetState();
}

class _ShowBottonSheetState extends State<CustomShowBottonSheet> {
  TextEditingController title = new TextEditingController();
  TextEditingController describtion = new TextEditingController();
  var dateSelected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 20),
            Text("Add Task", style: TextStyle(fontSize: 20, fontWeight: .w600)),
            SizedBox(height: 20),
            TextFormFiledWidget(
              controller: title,
              hintText: "Enter Task title",
              obscureText: false,
              validator: ValidatorApp.validateName,
            ),
            SizedBox(height: 10),
            TextFormFiledWidget(
              controller: title,
              hintText: "Enter Task describtion",
              obscureText: false,
              validator: ValidatorApp.validateName,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                IconAddTask(
                  imagePath: AppIcons.timerIcon,
                  onTap: () async {
                    dateSelected =
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                          initialDate: DateTime.now(),
                        ) ??
                        DateTime.now();
                  },
                ),
                SizedBox(width: 12),
                IconAddTask(
                  imagePath: AppIcons.perioretyIcon,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ShowAlertDialogPeriorety(
                        Periorety: (Index) {
                          print(Index);
                        },
                      ),
                    );
                  },
                ),
                Spacer(),
                IconAddTask(imagePath: AppIcons.sendIcon, onTap: () {}),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class IconAddTask extends StatelessWidget {
  IconAddTask({required this.imagePath, required this.onTap});
  String imagePath;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(imagePath, height: 24, width: 24, fit: BoxFit.contain),
    );
  }
}
