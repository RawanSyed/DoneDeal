import 'package:flutter/material.dart';

class addTask extends StatelessWidget {
  final Function addTaskCall;
  addTask(this.addTaskCall);

  @override
  Widget build(BuildContext context) {
    String? newTaskName;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text("Add Task",
              style: TextStyle(fontSize: 20, fontFamily: "Pacifico")),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (text) {
              newTaskName = text;
            },
          ),
          TextButton(
              onPressed: () {
                addTaskCall(newTaskName);
                
              },
              child: Text("Add",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 107, 139, 211))))
        ],
      ),
    );
  }
}
