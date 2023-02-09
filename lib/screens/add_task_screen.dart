import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  static const id = 'addtask_screen';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: controller,
          decoration: const InputDecoration(
            label: Text('Task Title'),
            hintText: 'Start typing...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  final String uuid = GUIDGEN.generate();
                  log('This is from GUID.generate: $uuid');
                  final task = Task(id: uuid, title: controller.text.trim());
                  context.read<TasksBloc>().add(AddTask(task: task));
                  controller.clear();
                  Navigator.pop(context);
                },
                child: const Text('Add')),
          ],
        ),
      ],
    );
  }
}
