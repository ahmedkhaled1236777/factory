

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/login/login.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../widgets/gradient.dart';

class sign_up extends StatefulWidget{
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController email=TextEditingController();

  TextEditingController phone=TextEditingController();

  TextEditingController username=TextEditingController();

  TextEditingController password=TextEditingController();

  GlobalKey<FormState> formkey=GlobalKey<FormState>();
Widget showcircle=Text("signup".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(child: gradients(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  children: [
                      SizedBox(height: 150,)   ,
                 Text("My Factory",style: TextStyle(fontSize: 55,fontFamily: 'great',fontWeight: FontWeight.w600),),
                    SizedBox(height: 40,),
                    TextFormField(
                      controller: username,
              validator: ((value) {
                if(value==null||value.isEmpty)
                return"erroruser".tr();
              }),
              decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    fillColor: Colors.black.withOpacity(0.04),
                    filled: true,
              hintText: "user name".tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
              ),
                    ),SizedBox(height: 10,),
                    TextFormField(
                      controller: phone,
              validator: ((value) {
                if(value==null||value.isEmpty)
                return"please input your phone".tr();
              }),
              decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone),
                    fillColor: Colors.black.withOpacity(0.04),
                    filled: true,
              hintText: "phone".tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
              ),
                    ),SizedBox(height: 10,),
                    TextFormField(
                      controller: email,
              validator: ((value) {
                if(value==null||value.isEmpty)
                return"email error".tr();
              }),
              decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    fillColor: Colors.black.withOpacity(0.04),
                    filled: true,
              hintText: "email".tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
              ),
                    ),SizedBox(height: 10,),
                     TextFormField(
                      controller: password,
                        validator: ((value) {
                                          if(value==null||value.isEmpty)

                return"errorpass".tr();
              }),
              decoration: InputDecoration(
                    
                    fillColor: Colors.black.withOpacity(0.04),
                    filled: true,
              hintText: "password".tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
              ),
                    ),SizedBox(height: 20,),
                   
                    MaterialButton(onPressed: (()async {
                      if(formkey.currentState!.validate()){
setState(() {
                        showcircle=CircleAvatar(backgroundColor: Colors.blue,child: CircularProgressIndicator(color: Colors.white));

});
                      
                      try {
              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email.text.trim(),
                password: password.text,
              );
              await credential.user!.sendEmailVerification().then((value) async {
              
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verify your email".tr())));
         await    user_service.set_users("data:image/jpeg;base64,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",credential.user!.uid,email.text.trim(),"manager",username.text,credential.user!.email!,true,phone.text);
              

              });
          Future.delayed(Duration(seconds: 1),(() {
             Navigator.pushReplacementNamed(context, "login");
          }))   ;

            } on FirebaseAuthException catch (e) {
              setState(() {
                        showcircle=Text("signup".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),);

});
              if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("weak password".tr())));  }
             else if (e.code == 'email-already-in-use') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("email-already-in-use".tr())));}
 
             else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));  
            
           
  }}}),child: Container(
              decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10)
                    ,color: Colors.blue
              ),
              padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child:showcircle ),),
                     SizedBox(height: 20,),
                    
                     Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                    Text("Already have an account ?".tr()),
                     TextButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "login");
        
                     }), 
                     child: Text("login".tr()),),
               ],
                     ),
                    
                  
                      SizedBox(height: 200,)      ],
              ),
            ),
          ),
        ),
      ),));
  }
}