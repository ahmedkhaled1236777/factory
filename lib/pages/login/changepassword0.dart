import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/sharedprefrences/subusersharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/gradient.dart';

class changepassword extends StatelessWidget{
    GlobalKey<FormState>formkey=GlobalKey<FormState>();
      TextEditingController currentpassword=TextEditingController();
      TextEditingController newpassword=TextEditingController();
      TextEditingController newpassword2=TextEditingController();


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
                          controller: currentpassword,
                           validator: (value) {
                            if(value!.isEmpty)return"Please input current password";
                            
                          },
                  
                  decoration: InputDecoration(
                      
                        fillColor: Colors.black.withOpacity(0.04),
                        filled: true,
                  hintText: "Current Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                        ),
                        SizedBox(height: 10,),
                       
                        TextFormField(
                          controller: newpassword,
                           validator: (value) {
                            if(value!.isEmpty)return"Please input new password";
                          },
                  
                  decoration: InputDecoration(
                      
                        fillColor: Colors.black.withOpacity(0.04),
                        filled: true,
                  hintText: "New password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                        ),
                        SizedBox(height: 10,),
                       
                        TextFormField(
                          controller: newpassword2,
                           validator: (value) {
                            if(value!.isEmpty)return"Please confirm new password";
                          },
                  
                  decoration: InputDecoration(
                      
                        fillColor: Colors.black.withOpacity(0.04),
                        filled: true,
                  hintText: "Confirm new password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))
                  ),
                        )
                        ,SizedBox(height: 20,),
                      
                      MaterialButton(onPressed: (()async{
if(formkey.currentState!.validate()){
User? user=await FirebaseAuth.instance.currentUser;
if(user!=null){
final cred=EmailAuthProvider.credential(email: user.email!, password: currentpassword.text);
user.reauthenticateWithCredential(cred).then((value) {
      if(newpassword.text!=newpassword2.text)throw"كلمات السر الجديده مختلفه ";

  user.updatePassword(newpassword.text).then((_) {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تمت تغيير كلمة السر")));
  Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);

}
).catchError((error) {
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(error.toString()))));
  });
}).catchError((err) {
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(err.toString()))));

});}

}}),
                       
              child: Container(
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(10)
                      ,color: Colors.blue
                ),
                padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("Change password",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),)),),
                     
                       
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