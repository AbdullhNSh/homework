
import 'package:flutter/material.dart';
import 'package:project/db_helper.dart';
import 'package:project/task_modle.dart';


class TaskWidget extends StatefulWidget{

  List<Task> country;

Task task;
Function function;
TaskWidget(this.task,[this.function]);

  
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {



   TextEditingController _textFieldController = TextEditingController();  
  
  Future<ConfirmAction> _displayDialog(BuildContext context) async {  
    String text  = "";
     bool  isCom =widget.task.isComplete;
    return showDialog(  
        context: context,  
        builder: (context) {  
          return AlertDialog(  
            title: Text('TextField AlertDemo'),  
            content: Container(
          child: Column(
       //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
        TextField( 
                onChanged: (value){
                  text=value;
                  print(value);
                  print(widget.task.isComplete);

                }, 
                controller: _textFieldController,  
                decoration: InputDecoration(hintText: "TextField in Dialog"),  
              ),
      Checkbox(value: widget.task.isComplete
      
      , onChanged: (value){
   isCom=value;
         
      }),

    

              ])),


            actions: <Widget>[  
              new FlatButton(  
                child: new Text('SUBMIT'),  
                onPressed: () {  
                
             Task oldtask=  widget.task;
             Task newtask =  Task(taskName:text,isComplete:isCom  );
           DBHelper.dbHelper.updateTask(oldtask,newtask);
            
            setState((){
                
                widget.function();

              });

                  print(text);
                  Navigator.of(context).pop();  
                },  
              )  
            ],  
          );  
        });  
  }  


myFun(){
    setState(() {});
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
            
                IconButton(icon: Icon(Icons.delete), 
                
                onPressed: () {
                    setState((){
                widget.function();

              });
                  setState(() {
                    
                   
                
                widget.function();

             
                   int x =  widget.task.id;
                  String name = widget.task.taskName;
                  bool isComplete =  widget.task.isComplete;
Task e =Task(taskName: name,isComplete: isComplete);

              // showAlertDialog(context,TaskWidget(e,myFun));
                     _asyncdeleteDialog(context,TaskWidget(e,myFun));
                   

              
                });
                setState((){
                widget.function();

              });
                }),
                new IconButton(
                      icon: const Icon(
                       Icons.edit,
                        ),
                        onPressed: () =>{

                         setState(() {
                 
                   _displayDialog(context);
                   widget.function();

                         }),
              
                }),
                
               
                

            Text(widget.task.taskName),
            Checkbox(
              value: widget.task.isComplete,
              onChanged: (value){
                 Task oldtask=  widget.task;

             Task newtask =  Task(taskName:oldtask.taskName,isComplete: value );
           DBHelper.dbHelper.updateTask(oldtask,newtask);

              
              setState((){
                
                widget.function();

              });
            })
       ],),
      ),
    );
  }

}


enum ConfirmAction { Cancel, Accept}  

Future<ConfirmAction> _asyncdeleteDialog(BuildContext context,TaskWidget e) async {  
  
  return showDialog<ConfirmAction>(  
    
    context: context,  
    barrierDismissible: false, // user must tap button for close dialog!  
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: Text('Delete This Contact?'),  
        content: const Text(  
            'This will delete the contact from your device.'),  
        actions: <Widget>[  
          FlatButton(  
            child: const Text('Cancel'),  
            onPressed: () {  
              e.function;
              Navigator.of(context).pop(ConfirmAction.Cancel);  
            },  
          ),  
          FlatButton(  
            child: const Text('Delete'),  
            onPressed: () {
            
           DBHelper.dbHelper.deleteTask(e);
         

        Navigator.of(context).pop(ConfirmAction.Accept); 
            },  
          )  
        ],  
      );  
    },  
  );  
}  

 
  
  
