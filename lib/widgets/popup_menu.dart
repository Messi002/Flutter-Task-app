import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key, required this.cancelOrDelete, required this.task}) : super(key: key);

  final VoidCallback cancelOrDelete;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted! ?  (context) => [
        PopupMenuItem(
            onTap: () {},
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.edit),
                label: const Text('Edit'))),
        PopupMenuItem(
            onTap: () {},
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.bookmark),
                label: const Text('Add to Bookmarks'))),
        PopupMenuItem(
            onTap: cancelOrDelete,
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'))),
      ] : (context) => [
         PopupMenuItem(
            onTap: (){},
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.restore_from_trash),
                label: const Text('Restore'))),
         PopupMenuItem(
            onTap: cancelOrDelete,
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete Forever'))),
      ],
    );
  }
}
