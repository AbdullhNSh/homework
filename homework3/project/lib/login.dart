

import 'package:flutter/material.dart';
import 'package:project/sp_helper.dart';
import 'package:project/task.dart';
import 'package:string_validator/string_validator.dart';
//import 'package:string_validator/string_validator.dart';

class Login extends StatelessWidget{

var name ="";
var email = "";







GlobalKey<FormState> formKey = GlobalKey();

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey();






  saveEmail(String value){
    this.email=value;
  }



saveName(String value){
      this.name=value;
}


saveForm(){
  
          if(formKey.currentState.validate()){
                

                formKey.currentState.save();
      var map = {'name' : '$name','email':'$email'};
      //  var map = {'name' : 'ahmed','age':18,'jop':"student"};
print(map);
 
 /* Navigator.of(context).push(MaterialPageRoute(builder: (context){
        var user = User(name, email);

              return TabBarPage(user);



             }));*/
          
              }else{

                 return;
               //scaffolKey.currentState.showSnackBar(
                //  SnackBar(content:Text('you have to accept out conditions')));
              }
          }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Sign up",),
      
    ),

    body: Container (
      
        color: Colors.blue,

        child: Form(
           key: formKey,
                  child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                        child:Column(
    children: [
                          
            Padding(    
               padding: EdgeInsets.only(top:100),
                child: Text(
            "Sign up",
            style: TextStyle(fontSize: 50),
            textAlign: TextAlign.center,
            
            ),
      ),

         Container(
          //margin: EdgeInsets.only(top:50),
          margin: EdgeInsets.only(top: 150),
          
        padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
        child: TextFormField(

          validator: (value){

     if(value==null || value ==""){
           return 'required field';
           
       }
               }     ,
          onChanged: (value){

            name= value;  
    },
            decoration: InputDecoration(
            labelText: 'User Name',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,//(color:Colors.black),
              borderRadius: BorderRadius.circular(50))),
        ),
),
   
Container(
  padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  child: TextFormField(

    validator: (value){

     if(value==null || value ==""){
           return 'required field';
           
       }/*else if(!isEmail(value)){
           return 'wrong email syntax';
       }*/
               }     ,
    onChanged: (value){
                email= value;
    },

  decoration: InputDecoration(
    labelText: 'Email',
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50))),
),
),

Container(
  
        height: 50,
        margin: EdgeInsets.only(top:150,bottom: 100),

        padding: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          child: Text('press me'),
          onPressed: (){
            saveForm();
       // SpHelper.spHelper.writeSomethingToSharedPrefrences(name,email);
         Navigator.of(context).push(MaterialPageRoute(builder: (context){
        var user = User(name, email);

        print(context);
     return TabBarPage(user);


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

