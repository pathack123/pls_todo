import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/tabs_screen.dart';
import 'package:todo_bloc/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case PendingTasksScreen.id:
        return MaterialPageRoute(builder: (_) => const PendingTasksScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());

      default:
        return null;

    }
  }
}
