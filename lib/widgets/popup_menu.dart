import 'package:flutter/material.dart';
import 'package:taskapp/models/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
    required this.cancelOrDelete,
    required this.likeOrDislike,
    required this.editTaskCallBack,
    required this.restoreTaskCallBack,
    required this.task,
  }) : super(key: key);

  final VoidCallback cancelOrDelete;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallBack;
  final VoidCallback restoreTaskCallBack;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted!
          ? (context) => [
                PopupMenuItem(
                    onTap: null,
                    child: TextButton.icon(
                        onPressed: editTaskCallBack,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'))),
                PopupMenuItem(
                    onTap:likeOrDislike,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false? const Icon(Icons.bookmark_add_outlined) : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false? const Text('Add to \nBookmarks') : const Text('Remove from \nBookmarks'))),
                PopupMenuItem(
                    onTap: cancelOrDelete,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'))),
              ]
          : (context) => [
                PopupMenuItem(
                    onTap: restoreTaskCallBack,
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
