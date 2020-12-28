import 'package:flutter/material.dart';
import 'package:project/new_task.dart';
import 'package:project/task_modle.dart';
import 'package:project/task_widget.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';



class TabBarPage extends StatefulWidget{
List<Task> task;
  TabBarPage(this.task);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
TabController tabController;

    void initState(){
      super.initState();
   tabController =TabController(length: 3,vsync: this);

    }
int index = 0;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
drawer: Drawer(child: Column(children:[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(child: Text('All Tasks'),),
          accountName:Text('All Tasks') , accountEmail: Text('All Tasks')
          ),
        
        ListTile(
          onTap: (){
            tabController.animateTo(0);
                        Navigator.pop(context);

          },
          title:Text('All Tasks'),
        subtitle:Text("all user\s tasks "),
        trailing: Icon(Icons.arrow_right),
        ),
ListTile(
  onTap: (){
            tabController.animateTo(1);
            Navigator.pop(context);
          },
  title:Text('Complete Tasks'),
        leading: Icon(Icons.done),
        trailing: Icon(Icons.arrow_right),
        ),

        ListTile(
          onTap: (){
            tabController.animateTo(2);
                        Navigator.pop(context);

          },
          title:Text('InComplete Tasks'),
        leading: Icon(Icons.done),
        trailing: Icon(Icons.arrow_right),
        ),
      ]),

      ),

      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return NewTask();
              },
            ));
          })
        ],
        title: Text('My Tasks'),
          bottom: TabBar(
            controller: tabController
            ,tabs: [
            Tab(text: "All Tasks",),
            Tab(text: "Complete Tasks",), 
            Tab(text: "InComplete Tasks",),
            ],
          isScrollable: true,
          ),),
      body: Column(
        children: [ Expanded(
            child: TabBarView(
  controller: tabController
              ,
          children: [  AllTasks(), CompleteTask(), InCompleteTask(), ],),
          ),
         


          ],
      ),
      );
  }


}
 
class AllTasks extends StatefulWidget{
  
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
 

    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
      ),
      body: Container( child: SingleChildScrollView(
          child: Column(
children: Provider.of<AppProvider>(context).taskis.map((e) => TaskWidget(e)).toList()

        ),
    ),)
     
    );
  }
  
}

class CompleteTask extends StatefulWidget{
  @override
  _CompleteTaskState createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  myFun(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
      ),
      body:  Container( child: SingleChildScrollView(
          child: Column(
children: Provider.of<AppProvider>(context).taskis.where((element) => element.isComplete==true).map((e) => TaskWidget(e,myFun)).toList()

        ),
    ),)
      
      
    );
  }
}


class InCompleteTask extends StatefulWidget{
  @override
  _InCompleteTaskState createState() => _InCompleteTaskState();
}

class _InCompleteTaskState extends State<InCompleteTask> {


   myFun(){
    setState(() {
      
    });
  }
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
      ),
      body:  Container( child: SingleChildScrollView(
          child: Column(
children: Provider.of<AppProvider>(context).taskis.where((element) => element.isComplete==false).map((e) => TaskWidget(e,myFun)).toList()

        ),
    ),)
    );
  }
}
