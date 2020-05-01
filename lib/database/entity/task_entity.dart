import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';

@Entity(tableName: 'Tasks', foreignKeys: [
  ForeignKey(
      childColumns: ['tasksListId'],
      parentColumns: ['listId'],
      entity: TasksListEntity)
])
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  final int taskId;
  final String taskName;
  @ColumnInfo(nullable: true)
  final String taskDetails;
  final String taskDateAndTime;
  final int tasksListId;

  TaskEntity(
      {this.taskId,
      @required this.taskName,
      this.taskDetails,
      this.taskDateAndTime,
      @required this.tasksListId});
}
