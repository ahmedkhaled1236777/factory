import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class profile extends StatefulWidget{
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File?image;

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
   return Scaffold(
body: Stack(
  children: [
    Column(
      children: [
        Container(
          child:  Padding(
            padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height*0.3)/3.5),
            child:                   Text("Profile".tr(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontFamily: 'cairo',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),),
      
          ),
          decoration: BoxDecoration(
                  color: appcolors.kprimarycolor,
        
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
        height: h*0.25,
        width: double.infinity,
        ),
      SizedBox(height: 70,),
      Expanded(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(height: 50,
              decoration: BoxDecoration(color: appcolors.amcolor.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(width: 10,),
                Text("${"name".tr()} : ",style: TextStyle(color: Colors.white,fontFamily: "cairo"),),
                Text(cashhelper.getstringdata("user_name"),style: TextStyle(color: Colors.white,fontFamily: "cairo"),softWrap: true,overflow: TextOverflow.ellipsis,)
              ],),
              ),
              SizedBox(height: 15,),
              Container(height: 50,
              decoration: BoxDecoration(color: appcolors.amcolor.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(width: 10,),
                Text("${"phone".tr()} : ",style: TextStyle(color: Colors.white,fontFamily: "cairo",
                ),),
   if(cashhelper.getstringdata("phone")!=null)             Text(cashhelper.getstringdata("phone"),style: TextStyle(color: Colors.white,fontFamily: "cairo"),softWrap: true,overflow: TextOverflow.ellipsis,)
              ],),
              ),
              SizedBox(height: 15,),
              Container(height: 50,
              decoration: BoxDecoration(color: appcolors.amcolor.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(width: 10,),
                Text("${"email".tr()} : ",style: TextStyle(color: Colors.white,fontFamily: "cairo"),),
                Text(cashhelper.getstringdata("email"),style: TextStyle(color: Colors.white,fontFamily: "cairo"),softWrap: true,overflow: TextOverflow.ellipsis,)
              ],),
              ),
              SizedBox(height: 15,),
              Container(height: 50,
              decoration: BoxDecoration(color: appcolors.amcolor.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(width: 10,),
                Expanded(child: Text("logout".tr(),style: TextStyle(color: Colors.white,fontFamily: "cairo"),)),
             IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: appcolors.thirdcolor,))
             ,SizedBox(width: 10,)
              ],),
              ),
             
              
            ],
          ),
        ),
      ))
      ],
    )
  ,Positioned(top: h*0.25-50,left: w*0.5-50,child: Stack(
   alignment: Alignment.bottomLeft,
    children: [
  CircleAvatar(backgroundColor: Colors.white,radius: 50,child: image!=null?CircleAvatar(radius: 45,backgroundImage:FileImage(image!)): ClipRRect(
                             borderRadius: BorderRadius.circular(80),
                             child: SizedBox(
                   height: 90,
                   width: 90,
                   child: CachedNetworkImage(
                     
                     fit: BoxFit.fill,
                     imageUrl: cashhelper.getstringdata("image")==null?"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbmB8QjPQMaiVi3yB0IckvPI1yiaYQLaAQ4g&usqp=CAU":cashhelper.getstringdata("image"),errorWidget: (context,url,Widget){
                     return Icon(Icons.person,color: Colors.white,);
                   },placeholder:(context,url){return CircularProgressIndicator();} ,),
                             ),
                           ),),
         IconButton(onPressed: () async {
         
          var imag=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(imag!=null){
     showDialog(context: context, builder: (_){
            return Center(child: CircularProgressIndicator());
          });
image=File(imag.path);

 var imagename=basename(image!.path);
var ref=FirebaseStorage.instance.ref("images/${imagename}");
await ref.putFile(image!);
String url=await ref.getDownloadURL();
 if(cashhelper.getstringdata("image")!="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbmB8QjPQMaiVi3yB0IckvPI1yiaYQLaAQ4g&usqp=CAU")await FirebaseStorage.instance.refFromURL(cashhelper.getstringdata("image")).delete();
await FirebaseFirestore.instance.collection("users").doc(cashhelper.getstringdata("email")).update({"image":url});
cashhelper.setstringdata("image", url);

setState(() {
  Navigator.pop(context);
  
});


  }
         }, icon: Icon(Icons.camera_alt))

    ],
  )),

  ],
),   );
  }
}