import 'package:floor/floor.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';

@dao
abstract class TasksListDao {
  @Query('SELECT * FROM TasksList')
  Future<List<TasksListEntity>> getAllTasksList();

  @Query('SELECT FROM * TasksList WHERE id = :id')
  Stream<TasksListEntity> findTasksListById(int tasksListId);

  @insert
  Future<void> insertTask(TasksListEntity tasksList);
}
