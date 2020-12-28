
import 'package:project/db_helper.dart';
import 'package:project/task.dart';
import 'package:project/task_modle.dart';


   var tasks = DBHelper.dbHelper.selectAllTasks() as Future<List<Task>>;

  

  
  List<Task> tasksg = [
  Task(taskName :'playing football',isComplete: false),
  Task(taskName :'ecommerce app',isComplete:true),
  Task(taskName :'study',isComplete:false),
  Task(taskName :'shopping',isComplete:false),
  Task(taskName :'pray',isComplete:true),
  Task(taskName :'watch movie',isComplete:false),
];

