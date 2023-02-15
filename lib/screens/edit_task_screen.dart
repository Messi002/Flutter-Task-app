import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';

class EditTaskScreen extends StatefulWidget {
  final Task oldtask;

  const EditTaskScreen({
    Key? key,
    required this.oldtask,
  }) : super(key: key);

  static const id = 'edittask_screen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late final TextEditingController textController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    textController = TextEditingController(text: widget.oldtask.title);
    descriptionController = TextEditingController( text: widget.oldtask.title);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Edit Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: TextField(
            autofocus: true,
            controller: textController,
            decoration: const InputDecoration(
              label: Text('Task Title'),
              hintText: 'Start typing...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Task Description'),
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
                  // final String uuid = GUIDGEN.generate();
                  // log('This is from GUID.generate: $uuid');
                  final editedTask = Task(
                      id: widget.oldtask.id,
                      title: textController.text.trim(),
                      isDone: false,
                      description: descriptionController.text.trim(),
                      isFavorite: widget.oldtask.isFavorite,
                      date: DateTime.now().toString());
                  context.read<TasksBloc>().add(EditTask(oldTask: widget.oldtask, newTask: editedTask));
                  textController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Save')),
          ],
        ),
      ],
    );
  }
}
