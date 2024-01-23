import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:fac_app/widgets/containereditsmaterial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class newsignup extends StatefulWidget{
  @override
  State<newsignup> createState() => _newsignupState();
}

class _newsignupState extends State<newsignup> {
  double elevation=10;
   TextEditingController email=TextEditingController();

  TextEditingController phone=TextEditingController();

  TextEditingController username=TextEditingController();

  TextEditingController password=TextEditingController();
      var ic=Icons.visibility;
            bool obsecure=false;
File? image;

  GlobalKey<FormState> formkey=GlobalKey<FormState>();
Widget showcircle=Text("signup".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body: Container(
  height: double.infinity,
  child: Stack(
    children: [
      Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              child: Center(child:    Text("My Factory",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontFamily: 'great',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),) ,),
              height: MediaQuery.of(context).size.height*0.25,
              decoration: BoxDecoration(
                color: appcolors.kprimarycolor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
              ),
            )
               ,SizedBox(height: 70,),
         Expanded(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 children: [
                   Material(
                            borderRadius: BorderRadius.circular(30),
                                          elevation: elevation,
                                          color: appcolors.backgroundColor,
                                          child: TextFormField(
                                                  validator: (value) {
                                                    if(value!.isEmpty||value==null)                return"erroruser".tr();
                   ;
                                                  },
                                                              controller: username,
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
                                                         prefixIcon: Icon(Icons.person,color: appcolors.amcolor,),
                                          fillColor: appcolors.backgroundColor,
                                          filled: true,
                                                              hintText: "user name".tr(),
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
                                                    if(value!.isEmpty||value==null) return"please input your phone".tr();
                                                  },
                                                              controller: phone,
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
                                                         prefixIcon: Icon(Icons.phone,color: appcolors.amcolor,),
                                          fillColor: appcolors.backgroundColor,
                                          filled: true,
                                                              hintText: "phone".tr(),
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
                                                    if(value!.isEmpty||value==null) return"email error".tr();
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
                                            obscureText: obsecure,
                                                  validator: (value) {
                                                    if(value!.isEmpty||value==null)   return"errorpass".tr();
                                                  },
                                                              controller: password,
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
                                                         suffixIcon:IconButton(onPressed: (){
        obsecure==false?obsecure=true:obsecure=false;
        ic==Icons.visibility?ic=Icons.visibility_off:ic=Icons.visibility;
        setState(() {
          
        });
        
                                                         }, icon: Icon(ic,color: appcolors.amcolor,)) ,
                                          fillColor: appcolors.backgroundColor,
                                          filled: true,
                                                              hintText: "password".tr(),
                                                              border: OutlineInputBorder(    
                            borderSide: BorderSide(color: appcolors.amcolor),
                         borderRadius: BorderRadius.circular(50))
                                                              ),
                                          ),
                                        ),SizedBox(height: 25,),
                                         MaterialButton(onPressed: (()async {
                          if(formkey.currentState!.validate()){
                     setState(() {
                            showcircle=CircleAvatar(backgroundColor: appcolors.kprimarycolor,child: CircularProgressIndicator(color: Colors.white));
                     
                     });
                          
                          try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text.trim(),
                    password: password.text,
                  );
                  await credential.user!.sendEmailVerification().then((value) async {
                    var imagename=basename(image!.path);
var ref=FirebaseStorage.instance.ref("images/${imagename}");
await ref.putFile(image!);
String url=await ref.getDownloadURL();
                  
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verify your email".tr())));
                      await    user_service.set_users(image==null?"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLYtxj-tne8GF3mErRrfyPwjRAr2VIkV5Ou0GWd8&s":url,credential.user!.uid,email.text.trim(),"manager",username.text,credential.user!.email!,true,phone.text);
                  
                     
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
                
               
                       }}
                       else {
                        elevation=0;
                        setState(() {
                          
                        });
                       }
                       }),child: Container(
                        height: 50,
                  decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(30)
                        ,color: appcolors.kprimarycolor
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child:showcircle ),),
                         SizedBox(height: 10,),
                        
                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                        Text("Already have an account ?".tr()),
                         TextButton(onPressed: (() {
                        Navigator.pushReplacementNamed(context, "newlogin");
                     
                         }), 
                         child: Text("login".tr(),style: TextStyle(color: appcolors.kprimarycolor)),),
                   ],
                         ),
                 ],
               ),
             ),
           ),
         ),
          ],
        ),
      )
   ,Positioned(child: Stack(
    alignment: Alignment.bottomLeft,
     children: [
       CircleAvatar(radius: 60,backgroundColor: Colors.white,child:image==null? CircleAvatar(radius: 55,backgroundColor: Colors.amber,backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/180/180693.png")):CircleAvatar(radius: 55,backgroundColor: Colors.amber,backgroundImage: FileImage(image!)),),
IconButton(onPressed: ()async{
  var imag=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(imag!=null){
    
image=File(imag.path);




setState(() {
  
});
  }

}, icon: Icon(Icons.camera_alt))
     ],
   ),top: MediaQuery.of(context).size.height*0.25-60,left: MediaQuery.of(context).size.width*0.5-60,)
    ],
  ),
),
   );
  }
}