import 'package:donedeal/add_task.dart';
import 'package:donedeal/models/tasks.dart';
import 'package:donedeal/task_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class do_list extends StatefulWidget {
  @override
  State<do_list> createState() => _do_listState();
}

class _do_listState extends State<do_list> {
  List<task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> decodedTasks = json.decode(tasksJson);
      setState(() {
        tasks = decodedTasks.map((item) => task.fromJson(item)).toList();
      });
    }
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> tasksJson =
        tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', json.encode(tasksJson));
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => addTask((newTaskName) {
              setState(() {
                tasks.add(task(name: newTaskName));
                _saveTasks();
                Navigator.pop(context);
              });
            }),
          );
        },
        backgroundColor: Color.fromARGB(255, 107, 139, 211),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 107, 139, 211),
                borderRadius: BorderRadius.circular(40),
              ),
              height: 110,
              width: 350,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 90,
                      width: 150,
                      child: Text(
                        "Manage your time well",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Pacifico",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 90),
                  Image(image: AssetImage("assets/do.png")),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Text(
              "You have ${tasks.length} tasks for today",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Pacifico",
              ),
            ),
          ),
          Expanded(
            child: tasksList(
              tasks: tasks,
              deleteTask: deleteTask,
            ),
          ),
        ],
      ),
    );
  }
}
