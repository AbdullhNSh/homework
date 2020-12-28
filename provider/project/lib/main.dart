import 'package:flutter/material.dart';
import 'package:project/app_provider.dart';
import 'package:project/db_helper.dart';
import 'package:project/login.dart';
import 'package:project/sp_helper.dart';
import 'package:project/splach.dart';
import 'package:project/task.dart';
import 'package:project/task_modle.dart';
import 'package:project/todoApp.dart';
import 'package:provider/provider.dart';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
 //await SpHelper.spHelper.initSharedPrefrences();
  runApp(MyApp());

   
}





class MyApp extends StatelessWidget {

  List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        debugShowCheckedModeBanner: false,

      home: TodoApp(tasks),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );*/return ChangeNotifierProvider(
          create: (context) { 
            return AppProvider();
           },
          child: MaterialApp(
        home: SplachPage(),
      ),
    );
  }
}

/*
 class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) { 
            return AppProvider();
           },
          child: MaterialApp(
        home: Screen1(),
      ),
    );
  }

} 
 */
/*
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return MaterialApp(
    home:Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         /* Container(
            
        margin: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
                     color: Colors.blueAccent,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Text('write on shared prefernce'),
              onPressed :(){
                SpHelper.spHelper.writeSomethingToSharedPrefrences('omer',8,true);

              },

  ),
          ),

   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('read from shared prefernce'),
              onPressed :(){
              Map map =   SpHelper.spHelper.getUserDate();
              print(map);
              },

  ),
   ),*/


   /*Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('insert in database'),
              onPressed :(){
                Task task  = Task(taskName : 'playing',isComplete:true);
                DBHelper.dbHelper.insertNewTask(task);
            
              },

  ),
   ),

   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('select All Tasks'),
              onPressed :(){
               DBHelper.dbHelper.selectAllTasks();

              },

  ),
   ),


   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('select one task'),
              onPressed :(){
               DBHelper.dbHelper.selectSpecificTask('playing');

              },

  ),
   ),


   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('update task'),
              onPressed :(){
                                Task task  = Task(taskName : 'playing',isComplete:true);

               DBHelper.dbHelper.updateTask(task);

              },

  ),
   ),


   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('read from shared prefernce'),
              onPressed :(){
             Task task  = Task(taskName : 'playing',iComplete:true);

               DBHelper.dbHelper.deleteTask(task);
              },

  ),
   ),

   Container(
             margin: EdgeInsets.symmetric(horizontal: 30),

     child: RaisedButton(
       color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

              child: Text('read from shared prefernce'),
              onPressed :(){
              //Map map =   SpHelper.spHelper.getUserDate();
              //print(map);
              },

  ),
   ),
*/

        ],
      ),
  ),
  );
    }
  
}
*/
