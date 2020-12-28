import 'package:flutter/material.dart';
import 'package:project/constans.dart';
import 'package:project/db_helper.dart';
import 'package:project/new_task.dart';
import 'package:project/task_modle.dart';
import 'package:project/task_widget.dart';

class User{
String name;
String email;
User(this.name,this.email);

}

class TabBarPage extends StatefulWidget{

  User user;
  TabBarPage(this.user);

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
          currentAccountPicture: CircleAvatar(child: Text(widget.user.name[0].toUpperCase()),),
          accountName:Text(widget.user.name) , accountEmail: Text(widget.user.email)
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
  myFun(){
    setState(() {
      //print(tasks);
    });
  }

    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
      ),
      body: new FutureBuilder<List<Task>>(
        future: DBHelper.dbHelper.selectAllTasks(),//homePresenter.getUser(),
        
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
         // print(data);
         return snapshot.hasData
        
              ? new Container(
              child: ListView(
                
              children: data.map((e) => TaskWidget(e,myFun)).toList()
              )
              // TaskWidget(data,myFun)
              
              )
              
              : new Center(child: new CircularProgressIndicator());

        },
      ),
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
      body: new FutureBuilder<List<Task>>(
        future: DBHelper.dbHelper.selectAllTasks(),//homePresenter.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
         
         // print(data);
         return snapshot.hasData
        
              ? new Container(
              child: ListView(
              children: data.where((element) => element.isComplete==true).map((e) => TaskWidget(e,myFun)).toList()
              
              ))
              : new Center(child: new CircularProgressIndicator());

        },
      ),
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
      body: new FutureBuilder<List<Task>>(
        future: DBHelper.dbHelper.selectAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

         
                  var data     = snapshot.data;

         
           
         
         return snapshot.hasData
        
              ? new Container(
              child: ListView(
              children: data.where((element) => element.isComplete==false).map((e) => TaskWidget(e,myFun)).toList()))
              : new Center(child: new CircularProgressIndicator());

        },
      ),
    );
  }
}
