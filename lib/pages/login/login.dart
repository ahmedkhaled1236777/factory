import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:fac_app/pages/categories/gridcategories.dart';
import 'package:fac_app/pages/login/resetpassword.dart';
import 'package:fac_app/pages/login/signup.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:fac_app/translations/codegen_loader.g.dart';
import 'package:fac_app/widgets/gradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';



 

class login extends StatefulWidget{

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  bool x=true;
  var fbm=FirebaseMessaging.instance;
  getidtoken(String id){
fbm.getToken().then((idtoken) async {
Query<Map<String, dynamic>> users=FirebaseFirestore.instance.collection("users");
await users.where("factory_ id",isEqualTo:id ).get().then((value){
  value.docs.forEach((element) {
    element.reference.update( {"idtoken":idtoken});
  });
});
});
  }
  bool isloading=false;
  var ico=Icons.visibility;
  @override
  Widget build(BuildContext context) {
   
    return   ModalProgressHUD
(
  color: Colors.white,
  opacity: 1,
      inAsyncCall: isloading,
      child: Scaffold(
        body:SafeArea(child: gradients(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey
                ,
                child:
                 Column(
                    children: [
                        SizedBox(height: 50,)   ,
                   Text("My Factory",style: TextStyle(fontSize: 55,fontFamily: 'great',fontWeight: FontWeight.w600),),
                      SizedBox(height: 40,),
                      TextFormField(
    validator: (value) {
      if(value!.isEmpty||value==null)return "erroruser".tr();
    },
                controller: email,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ), 
           prefixIcon: Icon(Icons.email),
                      fillColor: Colors.black.withOpacity(0.04),
                      filled: true,
                hintText: "email".tr(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                ),
                      ),SizedBox(height: 10,),
                       TextFormField(
                        validator: (value) {
                          if(value!.isEmpty||value==null)return"errorpass".tr();
                        },
                        controller: password,
                        obscureText: x,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                      suffixIcon: IconButton(onPressed: (() {
                       ico= ico==Icons.visibility?Icons.visibility_off:Icons.visibility;
                                      x==true?x=false:x=true;
    
                       setState(() {
                 
                       });
                      }), icon:Icon(ico)),
                      fillColor: Colors.black.withOpacity(0.04),
                      filled: true,
                    
                hintText: "password".tr(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                ),
                      ),SizedBox(height: 20,),
                      TextButton(onPressed: (() {
Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
  return resetpassword();
})))         ; 
                      }), child: Container(width: double.infinity,child:context.locale==Locale("en") ?Text("Forget password ?",textAlign: TextAlign.end,style: TextStyle(color: Colors.blue),):Text("هل نسيت كلمة المرور ؟",textAlign: TextAlign.end,style: TextStyle(color: Colors.blue)))),
                      SizedBox(height: 20,),
                      MaterialButton(onPressed: (() async{
                        if(formkey.currentState!.validate()){
                          isloading=true;
                          setState(() {
                            
                          });
                        try {
                          bool exists=false;
  await FirebaseFirestore.instance.collection("users").doc(email.text).get().then((value){
    exists=value.exists;
  });
  if(exists==false){                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user is notfound".tr())));
}
 

else{

                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email.text.trim(),
                  password: password.text,
                );
 await FirebaseFirestore.instance.collection("users").doc(email.text.trim()).get().then((value)   async {
            if(credential.user!.emailVerified==false&&value["role"]=="manager"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you should verify your account".tr())));
      await credential.user!.sendEmailVerification();
  }  
      
else if(value["block"]==true){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user is blocked".tr())));}

else                {  
  if(value["role"]=="manager"){getidtoken(value["factory_id"]);}
  
  await cashhelper.setstringdata("role", value["role"])   ;
  await cashhelper.setstringdata("user_name", value["user_name"])   ;
  await cashhelper.setstringdata("email", value["email"])   ;
  
 await cashhelper.setstringdata("factory_id", value["factory_id"]);
  Provider.of<settingsprovider>(context,listen: false).definerole(value["role"], context);}

              });
              }
          
                
               
            }   on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user is notfound".tr())));  } 
              else if (e.code == 'wrong-password') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wrong-password".tr())));
                }
              else                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There was an error please try again".tr())));

              
              }
              isloading=false;
             setState(() {
               
             });
                        
      }}),child: Container(
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(10)
                      ,color: Colors.blue
                ),
                padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("login".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize:context.locale==Locale("ar")? 20:25),)),),
                       SizedBox(height: 20,),
                      
                       Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                     Text("donthave").tr(),
                       TextButton(onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                      return sign_up();
                })));
                      
                       }), 
                       child: Text("signup",style: TextStyle(color: Colors.blue)).tr(),),
                 ],
                       ),
                       SizedBox(height: 20,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                            color: Colors.blue,
                            onPressed: (){
                              context.locale=Locale("ar");
                            },
                          child: Text("العربيه",style: TextStyle(color: Colors.white),),),
                          SizedBox(width: 10,),
                         MaterialButton(
                                                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),

                          color: Colors.blue,
                          onPressed: (){
                            context.locale=Locale("en");
                          },child: Text("english",style: TextStyle(color: Colors.white)),),

                        ],
                       )
                      ,
                    
                        SizedBox(height: 200,)      ],
                ),
              ),
            ),
          ),
        ),)),
    );}}
