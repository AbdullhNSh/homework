
import 'package:flutter/material.dart';
import 'package:project/db_helper.dart';

import 'constans.dart';
import 'task_modle.dart';

class NewTask extends StatefulWidget{

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isComplete = false;

  String taskName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
  appBar: AppBar(
    title: Text('New Task'),
  ),
  body: Container(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )),
        onChanged: (value){
          this.taskName = value;
        },
      ),
      Checkbox(value: isComplete, onChanged: (value){
          this.isComplete=value;
          setState(() {
            
          });
      }),
      RaisedButton(
        child: Text('Add New Task'),
        onPressed: (){

 Task task = Task(taskName: this.taskName, isComplete: this.isComplete);
                    DBHelper.dbHelper.insertNewTask(task);
               
      }),

   
  
    ],
  ),),
);  }
}