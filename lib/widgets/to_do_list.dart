import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:first/design/font_style.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  ToDoList(
      {super.key,
      required this.taskName,
      required this.isDone,
      this.onChanged,
      this.deleteFunc});
  final String taskName;
  final bool isDone;

  Function(bool?)? onChanged;
// onChanged — это переменная, которая может содержать функцию.
// Эта функция принимает один аргумент типа bool? (булевое значение или null).
// Эта функция ничего не возвращает.
// onChanged может быть null, то есть может не содержать никакой функции.
  Function(BuildContext)? deleteFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              onPressed: deleteFunc,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(right: 0),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(187, 81, 158, 222),
                const Color.fromARGB(255, 148, 208, 236)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskName,
                style: todoItemStyle,
              ),
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                activeColor: Colors.blue,
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
