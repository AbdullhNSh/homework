import 'package:flutter/material.dart';
import 'package:project/app_provider.dart';
import 'package:project/task.dart';
import 'package:project/task_modle.dart';
import 'package:provider/provider.dart';

import 'db_helper.dart';

 class SplachPage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     DBHelper.dbHelper.selectAllTasks().then((value) {


     //  Provider.of<AppProvider>(context).taskis;
       context.read<AppProvider>().setValues(value);
      // taskis.add(value);
      
       print(value);

       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
         return TabBarPage(value);
       }));
     });
    // TODO: implement build
     return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
 }