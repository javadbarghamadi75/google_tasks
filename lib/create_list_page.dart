import 'package:flutter/material.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';
import 'package:googletasks/res.dart';

import 'database/app_database.dart';

class CreateListPage extends StatefulWidget {
  @override
  _CreateListPageState createState() => _CreateListPageState();
}

class _CreateListPageState extends State<CreateListPage> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blackColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: lightGreyColor,
          ),
        ),
        title: Text(
          "Create new list",
          style: TextStyle(color: lightGreyColor),
        ),
        centerTitle: false,
        actions: <Widget>[
          FlatButton(
              onPressed: _saveList,
              child: Text("Done", style: TextStyle(color: lightBlueColor)))
        ],
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
          TextField(
            controller: _textFieldController,
            cursorColor: lightBlueColor,
            style: TextStyle(color: lightGreyColor),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: smallSpace),
                border: InputBorder.none,
                hintText: "Enter list title",
                hintStyle: TextStyle(color: lightGreyColor.withOpacity(0.5))),
          ),
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
        ],
      ),
    );
  }

  void _saveList() async {
    String listTitle = _textFieldController.text;
    if (listTitle == null && listTitle.isEmpty) {
      return;
    }
    TasksListEntity taskList = TasksListEntity(listName: listTitle);
    await AppDatabase.instance.taskListDao.insertTask(taskList);
    Navigator.pop(context);
  }
}
