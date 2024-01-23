import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class advertesments extends StatefulWidget{
  @override
  State<advertesments> createState() => _advertesmentsState();
}

class _advertesmentsState extends State<advertesments> {
  
File? image;

Widget showcircle=Text("adever".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body: Container(
  height: double.infinity,
  child:
      Column(
        children: [
Container(height: 300,width: double.infinity,color: Colors.grey.withOpacity(0.3),child: Stack(
  alignment: Alignment.center,
  children: [
  image==null?  Container(height: 300,color: Colors.grey.withOpacity(0.3)):Image.file(image!,fit: BoxFit.fitWidth,width: double.infinity,height: double.infinity,),
    IconButton(onPressed: () async {
      var imag=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(imag!=null){
        
    image=File(imag.path);
    
    
    
    
    setState(() {
      
    });
    
    }}, icon: Icon(Icons.camera_alt)),
  ],
),),
SizedBox(height: 10,),
 MaterialButton(onPressed: ()async {
                       
                   setState(() {
                          showcircle=CircleAvatar(backgroundColor: appcolors.kprimarycolor,child: CircularProgressIndicator(color: Colors.white));
                   
                   });
                        
                        try {
               
                
                  var imagename=basename(image!.path);
      var ref=FirebaseStorage.instance.ref("advertesments/${imagename}");
      await ref.putFile(image!);
      String url=await ref.getDownloadURL();
       await FirebaseFirestore.instance
            .collection("advertesments")
            
            .add({
          
          "image": url,
          "timestamp":FieldValue.serverTimestamp()
        });
                
               setState(() {
                image=null;
         showcircle=Text("Add image".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),);
                   
                   }); 
                
                   
                }
                     
                   
               on FirebaseAuthException catch (e) {
                setState(() {
                          showcircle=Text("Add image".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),);
                   
                   });
              
                     }},child: Container(
                      height: 50,
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(30)
                      ,color: appcolors.kprimarycolor
                ),
                padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child:showcircle )),

    ])));}}
       /*   Container(
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
               
                                       MaterialButton(onPressed: ()async {
                       
                   setState(() {
                          showcircle=CircleAvatar(backgroundColor: appcolors.kprimarycolor,child: CircularProgressIndicator(color: Colors.white));
                   
                   });
                        
                        try {
               
                
                  var imagename=basename(image!.path);
      var ref=FirebaseStorage.instance.ref("images/${imagename}");
      await ref.putFile(image!);
      String url=await ref.getDownloadURL();
                
              
                
                   
                }
                     
                   
               on FirebaseAuthException catch (e) {
                setState(() {
                          showcircle=Text("Add image".tr(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),);
                   
                   });
              
                     }},child: Container(
                      height: 50,
                decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(30)
                      ,color: appcolors.kprimarycolor
                ),
                padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child:showcircle ))),
                      
                   
               ],
             ),
           ),
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
   ;
  }
}*/