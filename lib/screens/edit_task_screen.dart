import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);

    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editedTask = Task(
                      title: titleController.text,
                      id: oldTask.id,
                      isDone: false,
                      isFavorite: oldTask.isFavorite,
                      description: descriptionController.text,
                      date: DateTime.now().toString(),
                    );
                    context.read<TasksBloc>().add(EditTask(oldTask: oldTask,newTask: editedTask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'))
            ],
          ),
        ],
      ),
    );
  }
}
