
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/login/addsubuser.dart';
import 'package:fac_app/pages/login/login.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';

import '../pages/categories/gridcategories.dart';
import '../widgets/removeoradd.dart';
class settingsprovider extends ChangeNotifier{
User ?user=FirebaseAuth.instance.currentUser;
 List users=[
    "production manager",
  "injection production engineer",
 "blow production engineer",
 "maintenance engineer",
 "quality engineer",
 "finish engineer",
 "material storekeeper",
 "categories storekeeper",
 

 ];
 String ?role;
 TextEditingController email=TextEditingController();
 TextEditingController user_name=TextEditingController();
  TextEditingController password=TextEditingController();
  changedroprole(value){
  role=value;
  notifyListeners();
}
resetdroprole(){
  role=null;
  notifyListeners();
}
restemailandpassword(){
  email.clear();
  password.clear();
  user_name.clear();
  notifyListeners();
}
checkrole(BuildContext context){
  if(role==null) showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose job".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}

  definerole(String role, BuildContext context)  async {


      if(role=="admin"){
       await FirebaseMessaging.instance.subscribeToTopic(cashhelper.getstringdata("factory_id"));
             Navigator.pushReplacementNamed(context, "admin");

      }
    
      else if(role=="manager"){
             await   FirebaseMessaging.instance.subscribeToTopic(cashhelper.getstringdata("factory_id"));

             Navigator.pushReplacementNamed(context, "grid_categoriesmanager");

      }
    

    else if(role=="production manager")
         Navigator.pushReplacementNamed(context, "production_manager");
 
  
    
     else if(role=="injection production engineer")

         Navigator.pushReplacementNamed(context, "injection_engineer");
    
  
    
     else if(role=="blow production engineer")

         Navigator.pushReplacementNamed(context, "blowing_engineer");
    
 
    
     else if(role=="maintenance engineer")

         Navigator.pushReplacementNamed(context, "maintenance_engineer");
    

    
    else if(role=="quality engineer")

         Navigator.pushReplacementNamed(context, "quality_engineer");
    
  
    else if(role=="finish engineer")

         Navigator.pushReplacementNamed(context, "finish_engineer");
    

    else if(role=="material storekeeper")

             Navigator.pushReplacementNamed(context, "material_person");


    
    else if(role=="categories storekeeper")
             Navigator.pushReplacementNamed(context, "types_person");

    else null;

  }



}