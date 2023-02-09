import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

  List<Task> taskList = [
    Task(title: 'task1'),
    Task(title: 'task2'),
    Task(title: 'task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(label: Text('Tasks:')),
          ),
          ListView.builder(
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
