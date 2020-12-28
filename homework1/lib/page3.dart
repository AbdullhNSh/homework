
import 'package:flutter/material.dart';
import 'package:homework1/page4.dart';

class Page3 extends StatelessWidget{

var fname ="";
var lname="";
var mname="";
var age = "";
var university="";
var name =""  ;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      appBar: AppBar(
      backgroundColor: Colors.amberAccent,
      title: Text("Sign up",),
      
    ),

    body: Container (
      
        color: Colors.amberAccent,

        child: Container(
                  child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                        child:Column(
    children: [
                          
            Padding(    
               padding: EdgeInsets.only(top:50),
                child: Text(
            "Sign up",
            style: TextStyle(fontSize: 50),
            textAlign: TextAlign.center,
            
            ),
      ),

      Container(
        margin: EdgeInsets.only(top:50),
        
      padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
      child: TextField(
        onChanged: (value){

          fname= value;  
    },
          decoration: InputDecoration(
          labelText: 'first name',
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,//(color:Colors.black),
            borderRadius: BorderRadius.circular(50))),
      ),
),
Container(
  padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  child: TextField(
    onChanged: (value){
                mname= value;
    },

  decoration: InputDecoration(
    labelText: 'meddle name',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50))),
),
),

Container(
  padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  child: TextField(
    onChanged: (value){
                lname= value;

    },

  decoration: InputDecoration(
    labelText: 'last name',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,//(color:Colors.black),
      borderRadius: BorderRadius.circular(50))),
),
),
Container(
  padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  child: TextField(

    onSubmitted: (value){
      print(value);
    },
    onChanged: (value){
                age= value;

    },
  decoration: InputDecoration(
    labelText: 'Age',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,//(color:Colors.black),
      borderRadius: BorderRadius.circular(50))),
),
),

Container(
  padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  child: TextField(
    onChanged: (value){
      university=value;
    },

  decoration: InputDecoration(
    labelText: 'university',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,//(color:Colors.black),
      borderRadius: BorderRadius.circular(50))),
),
),

Container(
        height: 50,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          child: Text('press me'),
          onPressed: (){

          name  =  fname+" "+ mname+" "+lname;
          print("hello");

             Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Page4(name,age,university);
             }));

           },
        
          ),
      )
          ]
          )
       ),
        )
      )
     );
   }

}