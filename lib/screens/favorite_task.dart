import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/screens/add_task_screen.dart';
import 'package:taskapp/screens/my_drawer.dart';
// import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/task_list.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.favoriteTasks.length} Tasks')),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
