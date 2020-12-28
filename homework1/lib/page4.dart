import 'package:flutter/material.dart';

class Page4 extends StatelessWidget{

String name;
String age;
String university;
Page4(this.name,this.age,this.university);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
                  backgroundColor: Colors.amberAccent,

      appBar: AppBar(
      title: Text("welcome"),
            backgroundColor: Colors.amberAccent[400],

    ),
    body: Center(
      child: Text("my name is : $name \n\n and he's $age years old \n \n \n and I study at the $university University",
            style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,

            
      ),
      ),
      );
  }

}