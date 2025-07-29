import 'package:first/data/tasks.dart';
import 'package:first/design/colors.dart';
import 'package:first/design/font_style.dart';
import 'package:first/widgets/dialog_box.dart';
import 'package:first/widgets/to_do_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// hive box
  final _box = Hive.box('tasks');

  final _controller = TextEditingController();
  TasksData tasksData = TasksData();

  @override
  void initState() {
    _box.get('toDoList') == null
        ? tasksData.createFirstTasks()
        : tasksData.loadTasks();

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasksData.tasksList[index][1] = !tasksData.tasksList[index][1];
    });
    tasksData.saveTasks();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors().primaryColor,
        centerTitle: true,
        title: Text(
          'To Do List',
          style: appBarTitleStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: AppColors().accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: tasksData.tasksList
              .length, //itemCount - это параметр, который указывает количество элементов в списке.
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: tasksData.tasksList[index][0],
              isDone: tasksData.tasksList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunc: (context) => deleteTask(index),
            );
          }),
    );
  }

  void saveNewTask() {
    setState(() {
      tasksData.tasksList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
      tasksData.saveTasks();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasksData.tasksList.removeAt(index);
    });
    tasksData.saveTasks();
  }
}
