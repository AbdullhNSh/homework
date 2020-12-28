/*import 'package:project/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SpHelper{
 SpHelper._();
 static SpHelper spHelper =  SpHelper._();

SharedPreferences sharedPrefrences;
 initSharedPrefrences() async{
   sharedPrefrences =await SharedPreferences.getInstance();
 }
 writeSomethingToSharedPrefrences(String name,String email){
   sharedPrefrences.setString('name',name);
      sharedPrefrences.setString('email',email);


 }
 User getUserDate(){
     String name =  sharedPrefrences.getString('name');
     String email =  sharedPrefrences.getString('email');
    User user=  User(name, email);
     return user;
//r//eturn{'name' : name , 'email': email};
 }
 }*/

 import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  writeSomethingToSharedPrefrences(String name, int age, bool isMale) {
    sharedPreferences.setString('name1', name);
    sharedPreferences.setInt('age1', age);
    sharedPreferences.setBool('isMale1', isMale);
  }

  Map getUserDate() {
    String name = sharedPreferences.getString('name1');
    int age = sharedPreferences.getInt('age1');
    bool isMale = sharedPreferences.getBool('isMale1');
    return {'name1': name, 'age1': age, 'isMale1': isMale};
  }
}
