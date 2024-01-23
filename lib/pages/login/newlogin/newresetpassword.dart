
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/login/newlogin/mypath.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class newresetpassword extends StatefulWidget{
  @override
  State<newresetpassword> createState() => _newresetpasswordState();
}

class _newresetpasswordState extends State<newresetpassword> {
  double elevation=10;
    GlobalKey<FormState>formkey=GlobalKey<FormState>();

      TextEditingController email=TextEditingController();

      TextEditingController confirmemail=TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                      children: [
 ClipPath(
              clipper: mypath(),
              child: Container(child: Padding(
                padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height*0.3)/4),
                child:                   Text("My Factory",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontFamily: 'great',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),),
          
              ),width: double.infinity,height: MediaQuery.of(context).size.height*0.28,color: appcolors.kprimarycolor,),)                       
                       ,   Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             Material(
                                               borderRadius: BorderRadius.circular(30),
                                      elevation: elevation,
                                      color: appcolors.backgroundColor,
                                      child: TextFormField(
                                              validator: (value) {
                                                if(value!.isEmpty||value==null)return "email error".tr();
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
                                                if(value!.isEmpty||value==null)return "Please confirm your email".tr();
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
                                                          hintText:"Confirm email".tr(),
                                                          border: OutlineInputBorder(    
                                               borderSide: BorderSide(color: appcolors.amcolor),
                                   borderRadius: BorderRadius.circular(30))
                                                          ),
                                      ),
                                    ),SizedBox(height: 35,),
                                                 
                             
                                                  
                                                   
                                                   MaterialButton(onPressed: (()async{
                             if(formkey.currentState!.validate()){
                               if(email.text==confirmemail.text){
                                 await FirebaseAuth.instance
                                 .sendPasswordResetEmail(email: email.text);
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your email to change password".tr())));
                                 Future.delayed(Duration(seconds: 2),(() {
                             Navigator.pushReplacementNamed(context, "login")  ;  }));
                                 
                               }
                               else     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email dosn't match".tr())));
                             
                             }
                             else {
                               elevation=0;
                               setState(() {
                                 
                               });
                             }
                             
                             
                                                   }),
                             
                                           child:  Container(
                height: 50,
                        decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(30)
                              ,color: appcolors.kprimarycolor
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("Reset password".tr(),textAlign: TextAlign.center,style: TextStyle(fontFamily: "laila",color: Colors.white,fontSize: 20),)),),
                                                  
                             
                                SizedBox(height: 400,),
                           ],
                         ),
                       )
                      ],
                  ),
                ),
              ),
  );
  }
}