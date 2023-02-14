import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key, required this.cancelOrDelete
  }) : super(key: key);

  final VoidCallback cancelOrDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
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
      ],
    );
  }
}
