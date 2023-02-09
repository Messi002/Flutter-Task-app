import 'package:flutter/material.dart';
import 'package:taskapp/screens/recycle_bin.dart';
import 'package:taskapp/screens/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TaskScreen.id:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      default:
        return null;
    }
  }
}
