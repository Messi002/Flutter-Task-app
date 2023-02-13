import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/screens/add_task_screen.dart';
import 'package:taskapp/screens/my_drawer.dart';
// import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/task_list.dart';

class CompleteTaskScreen extends StatelessWidget {
  const CompleteTaskScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  //1:23:00

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList = state.allTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.allTasks.length} Tasks')),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
