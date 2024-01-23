
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/gradient.dart';

class resetpassword extends StatelessWidget{
    GlobalKey<FormState>formkey=GlobalKey<FormState>();
      TextEditingController email=TextEditingController();
      TextEditingController confirmemail=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: gradients(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                      children: [
                        SizedBox(height:150),
                        Text("My Factory",style: TextStyle(fontSize: 55,fontFamily: 'great',fontWeight: FontWeight.w600),),
                        SizedBox(height: 40,),
                        TextFormField(
                          controller: email,
                           validator: (value) {
                            if(value!.isEmpty)return"email error".tr();
                            
                          },
                  
                  decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email
                        ),
                        fillColor: Colors.black.withOpacity(0.04),
                        filled: true,
                  hintText: "email".tr(),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                        ),
                        SizedBox(height: 10,),
                       
                        TextFormField(
                          controller: confirmemail,
                           validator: (value) {
                            if(value!.isEmpty)return"Please confirm your email".tr();
                          },
                  
                  decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email
                        ),
                        fillColor: Colors.black.withOpacity(0.04),
                        filled: true,
                  hintText: "Confirm email".tr(),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                        )
                        ,SizedBox(height: 20,),
                      
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


                      }),
                       
              child: Container(
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(10)
                      ,color: Colors.blue
                ),
                padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("Reset password".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),)),),
                     
                       
                          SizedBox(height: 400,)
                      ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
  
}