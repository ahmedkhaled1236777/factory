import 'package:fac_app/models/sharedprefrences/subusersharedprefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cashhelper{
static late SharedPreferences sharedpref;
static init()async{
  sharedpref=await SharedPreferences.getInstance();
}
static setstringdata(String key,String value)async{
return await sharedpref.setString(key, value);}
static setbooldata(String key,bool value)async{
  return await sharedpref.setBool(key, value);
}
static getstringdata(String key){
  return sharedpref.getString(key);
}
static getbooldata(String key){
    return sharedpref.getString(key);

}
static cleardata(){
  return sharedpref.clear();
}

}