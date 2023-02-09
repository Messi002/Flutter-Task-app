import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';

class TaskList extends StatelessWidget {

  final List<Task> taskList;

  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(value: task.isDone, onChanged:(value) {
              
            },),
          );
        },
      ),
    );
  }
}
