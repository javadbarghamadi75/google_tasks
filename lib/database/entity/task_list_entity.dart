import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@Entity(tableName: 'TasksList')
class TasksListEntity {
  @PrimaryKey(autoGenerate: true)
  final int listId;
  final String listName;

  TasksListEntity({this.listId, @required this.listName});
}
