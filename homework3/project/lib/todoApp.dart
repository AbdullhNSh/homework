


import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/sp_helper.dart';
import 'package:project/task.dart';

class TodoApp extends StatefulWidget {
  
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      children: [
        


 Container(
  
              height: 50,
              margin: EdgeInsets.only(top:150,bottom: 100),

              padding: EdgeInsets.symmetric(horizontal: 30),
                    child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                child: Text('تسجيل الدخول'),
                onPressed: (){
                                print('تسجيل الدخول');

                  // User user =  SpHelper.spHelper.getUserDate();
//print(SpHelper.spHelper.getUserDate());
                 //  print(user);

               //   if(SpHelper.spHelper.getUserDate() == null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                       return Login();
                    }));
                  //  print('تسجيل الدخول');

  /*                          
 }else{

                   //String name =    user.name;
                  // String email = user.email;
                 // User userinfo=User(name,email);
                     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                       return TabBarPage(user);
                    }));
                  }*/
               




                  }
                  // }
                   )
                   ),
                   Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('read from shared prefrences'),
                      onPressed: () {
                        Map map = SpHelper.spHelper.getUserDate();
                        print(map);
                      }),
                ),
                Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('write on shared prefrences'),
                  onPressed: () {
                    SpHelper.spHelper
                        .writeSomethingToSharedPrefrences('omar', 8, true);
                  }),
            ),
      
      ],
    );
             

      

  }}