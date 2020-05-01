import 'package:floor/floor.dart';
import 'package:googletasks/database/entity/task_entity.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Tasks')
  Future<List<TaskEntity>> getAllTasks();

  @Query('SELECT FROM * Tasks WHERE id = :id')
  Stream<TaskEntity> findTaskById(int taskId);

  @Query('SELECT FROM * Tasks WHERE tasksListId = :tasksListId')
  Future<List<TaskEntity>> findTasksByListId(int tasksListId);

  @insert
  Future<void> insertTask(TaskEntity task);
}
