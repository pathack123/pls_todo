import 'package:flutter/material.dart';

import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListTile(
          title: ExpansionPanelList.radio(
            children: tasksList
                .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) => TaskTile(task: task),
                    body: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Title\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.description),
                    ]))))
                .toList(),
          ),
        ),
      ),
    );
  }
}

// Expanded(
// child: ListView.builder(
// itemCount: tasksList.length,
// itemBuilder: (context, index) {
// var task = tasksList[index];
// return TaskTile(task: task);
// },
// ),
// );
