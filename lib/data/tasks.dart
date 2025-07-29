import 'package:hive_flutter/hive_flutter.dart';

class TasksData {
  List tasksList = [];

  final _box = Hive.box('tasks');

  //метод для открытия приложения самый 1й раз
  void createFirstTasks() {
    tasksList = [
      ['Task 1', false],
      ['Task 2', false],
    ];
  }

  //метод для загрузки данных из хранилища
  void loadTasks() {
    tasksList = _box.get('toDoList');
  }

  //метод для сохранения данных в хранилище
  void saveTasks() {
    _box.put('toDoList', tasksList);
  }
}
