import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/screens/my_drawer.dart';
import 'package:taskapp/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
      
      
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              title: const Text('Recycle Bin'),
              actions: [
                PopupMenuButton(itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () => context.read<TasksBloc>().add(DeleteAllTasks()),
                    child: TextButton.icon(onPressed: null, icon: const Icon(Icons.delete_forever), label: const Text('Delete all tasks')))
                ])
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(label: Text('${state.removedTasks.length}')),
                ),
                TaskList(taskList: state.removedTasks)
              ],
            ),
          );
        }
      
    );
  }
}
