import 'package:flutter/material.dart';

class taskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final void Function(bool?) checkboxchange;
  final void Function() onDelete;

  taskTile({
    required this.isChecked,
    required this.tasktitle,
    required this.checkboxchange,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tasktitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            activeColor: Color.fromARGB(255, 107, 139, 211),
            value: isChecked,
            onChanged: checkboxchange,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
             onDelete();
            },
          ),
        ],
      ),
    );
  }
}
