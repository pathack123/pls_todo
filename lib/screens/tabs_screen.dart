import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/add_task_screen.dart';
import 'package:todo_bloc/screens/completed_tasks_screen.dart';
import 'package:todo_bloc/screens/favorite_tasks_screen.dart';
import 'package:todo_bloc/screens/my_drawer.dart';
import 'package:todo_bloc/screens/pending_screen.dart';

class TabsScreen extends StatefulWidget {
   const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pageDetails = [
    {'pageName':const PendingTasksScreen(),'title':'Tasks'},
    {'pageName':const CompletedTasksScreen(),'title':'Completed Tasks'},
    {'pageName':const FavoriteTasksScreen(),'title':'Favorite Tasks'},

  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title'],style: const TextStyle(fontFamily:'Bangers'),),

      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0 ? FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ): null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_sharp), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
