import 'package:flutter/material.dart';
import 'package:to_do_lists/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todoo,
      required this.onDeleteItem,
      required this.onToDoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todoo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        tileColor: Theme.of(context).backgroundColor,
        leading: Icon(
          todoo.isDone ? Icons.check_box : (Icons.check_box_outline_blank),
          color: Theme.of(context).cardColor,
        ),
        title: Text(
          todoo.toDoText!,
          style: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w400,
              decoration: todoo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(3),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todoo.id);
            },
          ),
        ),
      ),
    );
  }
}
