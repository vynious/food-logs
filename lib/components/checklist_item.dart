// checklist_item.dart

import 'package:flutter/material.dart';

class ChecklistItem extends StatelessWidget {
  const ChecklistItem({
    Key? key,
    required this.itemText,
    required this.isChecked,
    required this.onChanged,
    required this.backgroundColor,
  }) : super(key: key);

  final String itemText;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(
          itemText,
          style: TextStyle(
            color: isChecked ? Colors.white : Colors.black, // White text color for checked item
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
