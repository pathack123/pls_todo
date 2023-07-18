import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/switch_bloc/switch_bloc.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/tabs_screen.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(),
              color: Colors.grey,
              child: const Text(
                'PLS TODO',

                style: TextStyle(fontFamily:'Bangers'),

              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                     TabsScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text("My Tasks",style: TextStyle(fontFamily:'Bangers',fontSize: 25 ),),
                    trailing: Text('${state.pendingTasks.length}',style: const TextStyle(fontFamily:'Bangers',fontSize: 25 ),),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    RecycleBin.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text("Bin",style: TextStyle(fontFamily:'Bangers',fontSize: 25 ),),
                    trailing: Text('${state.removedTasks.length} '),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Row(

                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text('Theme',style: TextStyle(fontFamily:'Bangers',fontSize: 30 ),),
                    ),
                    Switch(
                      value: state.switchValue,
                      onChanged: (newValue) {
                        newValue?
                             context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
