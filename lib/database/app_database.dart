import 'package:floor/floor.dart';
import 'package:googletasks/database/dao/task_dao.dart';
import 'package:googletasks/database/dao/task_list_dao.dart';
import 'package:googletasks/database/entity/task_entity.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [TaskEntity, TasksListEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
  TasksListDao get taskListDao;

  static AppDatabase instance;
}
