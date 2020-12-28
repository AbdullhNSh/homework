import 'package:path/path.dart';
import 'package:project/task_modle.dart';
import 'package:project/task_widget.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {

  DBHelper._();

  static DBHelper dbHelper = DBHelper._();
  static final String databaseName = 'tasksDb.db';
  static final String tableName = 'tasks';
  static final String taskIdColumnName = 'id';
  static final String taskNameColumnName = 'name';
  static final String taskIsCompleteColumnName = 'isComplete';
  Database database;
  Future<Database> initDatabase() async {
    if (database == null) {
      return await createDatabase();
    } else {
      return database;
    }
  }

  Future<Database> createDatabase() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      Database database = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) {
          db.execute('''CREATE TABLE $tableName(
            $taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $taskNameColumnName TEXT NOT NULL,
            $taskIsCompleteColumnName INTEGER
          )''');
        },
      );
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewTask(Task task) async {
    try {
      database = await initDatabase();
      int x = await database.insert(tableName, task.toJson());
      print(x);
    } on Exception catch (e) {
      print(e);
    }
  }


Future<List<Task>> selectAllTasks() async {
    try {
      database = await initDatabase();

      List<Map> result = await database.query(tableName);

     List<Task> tasks = result.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

 
  Future<Map> selectSpecificTask(String id) async {
    try {
      database = await initDatabase();
      List<Map> result = await database
          .query(tableName, where: '$taskNameColumnName=?', whereArgs: [id]);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }
/*
  updateTask(String oldname,Task task) async {
    try {


      database = await initDatabase();
      int result = await database.update(tableName, task.toJson(),
          where: '$taskNameColumnName=?', whereArgs: [oldname]);


      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }*/

 updateTask(Task oldtask,Task task) async {
    try {
      database = await initDatabase();
      int result = await database.update(tableName, task.toJson(),
          where: '$taskNameColumnName=?', whereArgs: [oldtask.taskName]);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }


  deleteTask(TaskWidget task) async {
    try {
      print(task);
            task.function;

      database = await initDatabase();
      int result = await database.delete(tableName,
          where: '$taskNameColumnName=?', whereArgs: [task.task.taskName]);
          //UPDATE tasks SET id = NULL, name = ?, isComplete = ? WHERE name=?
      print(result);
      task.function;
    } on Exception catch (e) {
      print(e);
    }
  }
}
