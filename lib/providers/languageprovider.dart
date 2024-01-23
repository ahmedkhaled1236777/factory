import 'package:fac_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class languageprovider  {
 static  SharedPreferences? pref;
 static init()async{
  pref=await SharedPreferences.getInstance();
 }
static  put(String x,bool y)async{
   return await pref?.setBool(x, y);

}
static getdata(String t){
 return  pref?.getBool(t);

}


}
