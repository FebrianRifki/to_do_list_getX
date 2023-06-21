import 'package:getx_to_do_list/app/data/providers/task/provider.dart';
import '../../models/task.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTask();
  void writeTask(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
