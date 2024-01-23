import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/login/newlogin/mypath.dart';
import 'package:fac_app/pages/login/newlogin/newresetpassword.dart';
import 'package:fac_app/pages/login/newlogin/newsignup.dart';
import 'package:fac_app/pages/login/resetpassword.dart';
import 'package:fac_app/pages/login/signup.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class newlogin extends StatefulWidget{
  @override
  State<newlogin> createState() => _newloginState();
}

class _newloginState extends State<newlogin> {
  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  bool x=true;
double elevation=10;

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
return ModalProgressHUD(
   inAsyncCall: isloading,
  child: Scaffold(
    backgroundColor: appcolors.backgroundColor,
    body: Form(
      key: formkey,
      child: Column(
        children: [
         ClipPath(
          clipper: mypath(),
          child: Container(child: Padding(
            padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height*0.3)/4),
            child:                   Text("My Factory",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontFamily: 'great',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),),
      
          ),width: double.infinity,height: MediaQuery.of(context).size.height*0.28 ,color: appcolors.kprimarycolor,),)
        
        ,Expanded(child:   SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Column(
                            children: [
                             
                              Material(
                  borderRadius: BorderRadius.circular(30),
                                elevation: elevation,
                                color: appcolors.backgroundColor,
                                child: TextFormField(
                                        validator: (value) {
                                          if(value!.isEmpty||value==null)return "erroruser".tr();
                                        },
                                                    controller: email,
                                                    decoration: InputDecoration(
                                                    errorBorder:   OutlineInputBorder(
                                                        borderSide: BorderSide(color: appcolors.thirdcolor),
                                                        borderRadius: BorderRadius.circular(30)
                                                      ), 
                                                      enabledBorder:  OutlineInputBorder(
                                                        borderSide: BorderSide(color: appcolors.amcolor),
                                                        borderRadius: BorderRadius.circular(30)
                                                      ), 
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: appcolors.amcolor),
                                                        borderRadius: BorderRadius.circular(30)
                                                      ), 
                                               prefixIcon: Icon(Icons.email,color: appcolors.amcolor,),
                                fillColor: appcolors.backgroundColor,
                                filled: true,
                                hintStyle: TextStyle(fontFamily: apptexts.appfonfamily),
                                                    hintText: "email".tr(),
                                                    border: OutlineInputBorder(    
                  borderSide: BorderSide(color: appcolors.amcolor),
      borderRadius: BorderRadius.circular(30))
                                                    ),
                                ),
                              ),SizedBox(height: 10,),
                               Material(
  
                  borderRadius: BorderRadius.circular(30),
                                elevation: elevation,
                                color: appcolors.backgroundColor,
                                 child: TextFormField(
                                  
                                  validator: (value) {
                                    if(value!.isEmpty||value==null)return"errorpass".tr();
                                  },
                                  controller: password,
                                  obscureText: x,
                                                     decoration: InputDecoration(
                                                        enabledBorder:  OutlineInputBorder(
                                                        borderSide: BorderSide(color: appcolors.amcolor),
                                                        borderRadius: BorderRadius.circular(30)
                                                      ), 
                                                       focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: appcolors.amcolor),
                                                          borderRadius: BorderRadius.circular(30)
                                                        ), 
                                                           suffixIcon: IconButton(onPressed: (() {
                                 ico= ico==Icons.visibility?Icons.visibility_off:Icons.visibility;
                                                x==true?x=false:x=true;
                                         
                                 setState(() {
                                                      
                                 });
                                                           }), icon:Icon(ico,color: appcolors.amcolor,)),
                                                           fillColor: appcolors.backgroundColor,
                                                           filled: true,
                                                                                         hintStyle: TextStyle(fontFamily: apptexts.appfonfamily),

                                                     hintText: "password".tr(),
                                                     border:OutlineInputBorder(                                                    borderSide: BorderSide(color: appcolors.amcolor),
                                 borderRadius: BorderRadius.circular(30))
                                                     ),
                                                           ),
                               ),SizedBox(height: 20,),
                              TextButton(onPressed: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return newresetpassword();
            })))         ; 
                              }), child: Container(width: double.infinity,child:context.locale==Locale("en") ?Text("Forget password ?",textAlign: TextAlign.end,style: TextStyle(color: appcolors.kprimarycolor,fontFamily: apptexts.appfonfamily)):Text("هل نسيت كلمة المرور ؟",textAlign: TextAlign.end,style: TextStyle(color: appcolors.kprimarycolor,fontFamily: apptexts.appfonfamily)))),
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
  await cashhelper.setstringdata("image", value["image"])   ;
  
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
                        
      }
              }),child: Container(
                height: 50,
                        decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(30)
                              ,color: appcolors.kprimarycolor
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("login".tr(),textAlign: TextAlign.center,style: TextStyle(fontFamily: apptexts.appfonfamily,color: Colors.white,fontSize: 20),)),),
                               SizedBox(height: 20,),
                              
                               Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                             Text("donthave",style: TextStyle(fontFamily: apptexts.appfonfamily),).tr(),
                               TextButton(onPressed: (() {
                                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                              return newsignup();
                        })));
                              
                               }), 
                               child: Text("signup",style: TextStyle(color: appcolors.kprimarycolor,fontFamily: apptexts.appfonfamily)).tr(),),
                         ],
                               ),
                               SizedBox(height: 20,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                                    color: appcolors.kprimarycolor,
                                    onPressed: (){
                                      context.locale=Locale("ar");
                                    },
                                  child: Text("العربيه",style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily),),),
                                  SizedBox(width: 10,),
                                 MaterialButton(
                                                              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
            
                                  color: appcolors.kprimarycolor,
                                  onPressed: (){
                                    context.locale=Locale("en");
                                  },child: Text("English",style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily)),),
            
                                ],
                               )
                              ,
                            
                                  ],
                        ),
          ),
        ),)
        ],
      ),
    ),
  ),
)
;
  }
}
