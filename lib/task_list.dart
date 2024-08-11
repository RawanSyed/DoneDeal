import 'package:donedeal/models/tasks.dart';
import 'package:donedeal/task_tile.dart';
import 'package:flutter/material.dart';

class tasksList extends StatefulWidget {
  final List<task> tasks;
  final void Function(int) deleteTask;
  tasksList({required this.tasks, required this.deleteTask});

  @override
  State<tasksList> createState() => _tasksListState();
}

class _tasksListState extends State<tasksList> {
  void deleteTask(int index) {
    setState(() {
      widget.tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 107, 139, 211)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: taskTile(
              tasktitle: widget.tasks[index].name,
              isChecked: widget.tasks[index].isDone,
              checkboxchange: (bool? newvalue) {
                setState(() {
                  widget.tasks[index].done();
                });
              },
              onDelete: () {
                widget.deleteTask(index);
              },
            ),
          ),
        );
      },
    );
  }
}
