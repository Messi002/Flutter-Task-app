import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';
import 'package:taskapp/widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

//TODO: Test out orientation
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.star_outline),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      // Text(DateFormat('dd-MM-yyyy').format(DateTime.now())), //OR THE ONE BELOW
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hm()
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: !task.isDeleted!
                    ? (value) {
                        log('$value');
                        context
                            .read<TasksBloc>()
                            .add(CheckIfTaskIsDone(task: task));
                      }
                    : null,
              ),
              PopupMenu(
                task: task,
                cancelOrDelete: () => _removeOrDeleteTask(context, task),
                likeOrDislike: () => context.read<TasksBloc>().add(MarkFavoriteOrUnfavoriteTask(task: task)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





// ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged: !task.isDeleted! ? (value) {
//           log('$value');
//           context.read<TasksBloc>().add(CheckIfTaskIsDone(task: task));
//         } : null,
//       ),
//       onTap: () => _removeOrDeleteTask(context, task),
//     );