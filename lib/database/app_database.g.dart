// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao _taskDaoInstance;

  TasksListDao _taskListDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tasks` (`taskId` INTEGER PRIMARY KEY AUTOINCREMENT, `taskName` TEXT, `taskDetails` TEXT, `taskDateAndTime` TEXT, `tasksListId` INTEGER, FOREIGN KEY (`tasksListId`) REFERENCES `TasksList` (`listId`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TasksList` (`listId` INTEGER PRIMARY KEY AUTOINCREMENT, `listName` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  TasksListDao get taskListDao {
    return _taskListDaoInstance ??= _$TasksListDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'Tasks',
            (TaskEntity item) => <String, dynamic>{
                  'taskId': item.taskId,
                  'taskName': item.taskName,
                  'taskDetails': item.taskDetails,
                  'taskDateAndTime': item.taskDateAndTime,
                  'tasksListId': item.tasksListId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _tasksMapper = (Map<String, dynamic> row) => TaskEntity(
      taskId: row['taskId'] as int,
      taskName: row['taskName'] as String,
      taskDetails: row['taskDetails'] as String,
      taskDateAndTime: row['taskDateAndTime'] as String,
      tasksListId: row['tasksListId'] as int);

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM Tasks', mapper: _tasksMapper);
  }

  @override
  Stream<TaskEntity> findTaskById(int taskId) {
    return _queryAdapter.queryStream('SELECT FROM * Tasks WHERE id = ?',
        arguments: <dynamic>[taskId], tableName: 'Tasks', mapper: _tasksMapper);
  }

  @override
  Future<List<TaskEntity>> findTasksByListId(int tasksListId) async {
    return _queryAdapter.queryList('SELECT FROM * Tasks WHERE tasksListId = ?',
        arguments: <dynamic>[tasksListId], mapper: _tasksMapper);
  }

  @override
  Future<void> insertTask(TaskEntity task) async {
    await _taskEntityInsertionAdapter.insert(
        task, sqflite.ConflictAlgorithm.abort);
  }
}

class _$TasksListDao extends TasksListDao {
  _$TasksListDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _tasksListEntityInsertionAdapter = InsertionAdapter(
            database,
            'TasksList',
            (TasksListEntity item) => <String, dynamic>{
                  'listId': item.listId,
                  'listName': item.listName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _tasksListMapper = (Map<String, dynamic> row) => TasksListEntity(
      listId: row['listId'] as int, listName: row['listName'] as String);

  final InsertionAdapter<TasksListEntity> _tasksListEntityInsertionAdapter;

  @override
  Future<List<TasksListEntity>> getAllTasksList() async {
    return _queryAdapter.queryList('SELECT * FROM TasksList',
        mapper: _tasksListMapper);
  }

  @override
  Stream<TasksListEntity> findTasksListById(int tasksListId) {
    return _queryAdapter.queryStream('SELECT FROM * TasksList WHERE id = ?',
        arguments: <dynamic>[tasksListId],
        tableName: 'TasksList',
        mapper: _tasksListMapper);
  }

  @override
  Future<void> insertTask(TasksListEntity tasksList) async {
    await _tasksListEntityInsertionAdapter.insert(
        tasksList, sqflite.ConflictAlgorithm.abort);
  }
}
