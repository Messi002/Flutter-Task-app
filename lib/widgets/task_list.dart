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
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio( //TODO: try to wrap this with expand widget and remove it from top
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isExpanded) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                       TextSpan(
                        text: task.title,
                      ),
                      const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: task.description,
                      ),
                    ])),
                  )))
              .toList(),
        ),
      ),
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