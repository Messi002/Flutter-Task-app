import 'package:flutter/material.dart';
import 'package:taskapp/screens/recycle_bin.dart';
import 'package:taskapp/screens/tabs_screen.dart';
import 'package:taskapp/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case PendingTaskScreen.id:
        return MaterialPageRoute(builder: (_) => const PendingTaskScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) =>  TabsScreen());
      default:
        return null;
    }
  }
}
