import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;

  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: taskList.map((task) => ExpansionPanelRadio(
        value: task.id , 
        headerBuilder:(context, isExpanded) => TaskTile(task: task), 
        body: SelectableText.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Text',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
                const TextSpan(
                text: 'Description',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
                const TextSpan(
                text: 'Text',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ]
          )
        )
        )).toList(),
    );
  }
}



// Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: taskList.length,
//         itemBuilder: (context, index) {
//           final task = taskList[index];
//           return TaskTile(task: task);
//         },
//       ),
//     );