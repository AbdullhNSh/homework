
import 'package:flutter/material.dart';
import 'package:project/db_helper.dart';
import 'package:project/task_modle.dart';

class AppProvider extends ChangeNotifier  {


    List<Task> taskis =[];
//Future<List<Task>> taskprovider =  DBHelper.dbHelper.selectAllTasks();
    //  print(dataList);


  

  String name ='omer';
  String address = 'gaza';
  setValues(List taskis){
this.taskis=taskis;
notifyListeners();
  }
}