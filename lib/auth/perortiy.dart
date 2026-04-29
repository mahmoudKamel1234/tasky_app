import 'package:flutter/material.dart';
import 'package:tasky_app/ui/color.dart';
import 'package:tasky_app/ui/icon.dart';


class ShowAlertDialogPeriorety extends StatefulWidget {
  ShowAlertDialogPeriorety({super.key, required this.Periorety});
  void Function(int taskPeriorety) Periorety;

  @override
  State<ShowAlertDialogPeriorety> createState() =>
      _ShowAlertDialogPerioretyState();
}

class _ShowAlertDialogPerioretyState extends State<ShowAlertDialogPeriorety> {
  List<int> perioretyIndex = List.generate(10, (index) => index + 1);
  int isSelected = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add periorety",
        style: TextStyle(fontSize: 16, fontWeight: .bold),
      ),
      content: Wrap(
        children: perioretyIndex
            .map<ItemTaskPriority>(
              (index) => ItemTaskPriority(
                index,
                index == isSelected,
                onTap: () {
                  isSelected = index;
                  widget.Periorety(isSelected);
                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class ItemTaskPriority extends StatelessWidget {
  const ItemTaskPriority(this.index, this.isSelected, {this.onTap});
  final int index;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        margin: const EdgeInsets.only(right: 3, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(10),

          border: Border.all(
            color: isSelected ? AppColor.primaryColor : Color(0xfffffffff),
          ),
        ),
        child: Column(
          spacing: 7,
          children: [
            Image.asset(
              AppIcons.perioretyIcon,
              height: 24,
              width: 24,
              color: isSelected ? Color(0xff000000) : null,
            ),
            Text(
              index.toString(),
              style: TextStyle(
                color: isSelected ? Color(0xffffffff) : Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
