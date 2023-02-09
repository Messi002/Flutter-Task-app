import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';

import '../blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final TextEditingController controller = TextEditingController();

    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20),
      child: Column(
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
                    final task = Task(title: controller.text.trim());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    controller.clear();
                    Navigator.pop(context);
                
                  },
                  child: const Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}
