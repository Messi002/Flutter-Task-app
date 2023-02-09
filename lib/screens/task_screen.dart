import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/add_task_screen.dart';
// import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SingleChildScrollView(
          child: AddTaskScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task App'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(label: Text('Tasks:')),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

