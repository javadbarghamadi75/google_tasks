import 'package:flutter/material.dart';
import 'package:googletasks/bottom_sheet_create_task.dart';
import 'package:googletasks/bottom_sheet_menu.dart';
import 'package:googletasks/bottom_sheet_more_options.dart';
import 'package:googletasks/database/app_database.dart';
import 'package:googletasks/database/entity/task_entity.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';
import 'package:googletasks/res.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  TasksListEntity _currentTasksList =
      TasksListEntity(listId: 1, listName: 'My Tasks');
  List<TaskEntity> _tasksList = [];
  List<TasksListEntity> _tasksLists = [];

  @override
  void initState() {
    super.initState();
    _getAllTasksLists();
    _getAllTasks(_currentTasksList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: blackColor,
          title: Padding(
            padding: const EdgeInsets.only(
              left: normalSpace,
            ),
            child: Text(
              'My Tasks',
              style: TextStyle(
                fontSize: largeTextSize,
                color: lightGreyColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
        ),
        body: _getBody(),
        bottomNavigationBar: BottomAppBar(
//          notchMargin: 3,
          shape: CircularNotchedRectangle(),
          color: greyColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  size: smallButtonSize,
                  color: lightGreyColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bctx) => MenuBottomSheet(),
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: smallButtonSize,
                  color: lightGreyColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bctx) => MoreOptionsBottomSheet(),
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext bctx) => CreateTaskBottomSheet(),
              backgroundColor: Colors.transparent,
            );
          },
          child: Icon(
            Icons.add,
            size: normalButtonSize,
          ),
          backgroundColor: greyColor.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(verySmallSpace),
          child: RadioListTile(
            value: 1,
            groupValue: 0,
            title: Text(
              '${_tasksList[index].taskName}',
              style: TextStyle(
                  fontSize: normalTextSize,
                  color: lightGreyColor,
                  fontFamily: 'CenturyGothic'),
            ),
            onChanged: (int value) {},
            subtitle: Text(
              '${_tasksList[index].taskDetails}',
              style: TextStyle(
                  fontSize: normalTextSize,
                  color: lightGreyColor,
                  fontFamily: 'CenturyGothic'),
            ),
          ),
        );
      },
      itemCount: _tasksList.length,
    );
  }

  _getAllTasks(tasksListId) async {
    _tasksList = await AppDatabase.instance.taskDao.getAllTasks();
    setState(() {});
  }

  _getAllTasksLists() async {
    var allTasksLists =
    await AppDatabase.instance.taskListDao.getAllTasksLists();
    if (allTasksLists == null || allTasksLists.isEmpty) {
      _tasksLists.add(TasksListEntity(listId: 1, listName: 'My Tasks'),);
      AppDatabase.instance.taskListDao.insertTasksList(
        TasksListEntity(listId: 1, listName: 'My Tasks'),
      );
    } else {
      setState(() {
        _tasksLists = allTasksLists;
        _currentTasksList = allTasksLists.last;
      });
    }
  }
}
