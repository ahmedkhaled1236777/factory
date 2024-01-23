import 'package:shared_preferences/shared_preferences.dart';

class sharedprefrences{
  String? user_name;
  String ?factory_id;
 static Future<String?> getusername()async{
var pref =await SharedPreferences.getInstance();
     String? user_name=pref.getString("user-name");
     return user_name;

 }
 static Future<String?> getfactory_id()async{
var pref =await SharedPreferences.getInstance();
     String? factory_id=pref.getString("factory-id");
     return factory_id;

 }
 
    
}