
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/maintenance/maintenance.dart';
import 'package:fac_app/services/maintenanceservice/macmaintenanceservice.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/maintenanceprovider.dart';

class showmainteancedialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<maintenceprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
actions: [
  Row(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children: [


                   Text("date".tr()),
                   Text(" : "),
                   
                                Text(prov.date),


     
    ],),
 
  
  if(prov.machinename.text.isNotEmpty)  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("machine".tr()),

       Text(" : "),
             Text(prov.machinename.text),

     
    ],
  ),
 if(prov.mold.text.isNotEmpty)  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("mold name".tr()),

       Text(" : "),
             Text(prov.mold.text),

     
    ],
  ),
  
   if(prov.stopreasons.text.isNotEmpty) 
 Row(

        mainAxisAlignment: MainAxisAlignment.start,
 
    children: [
            Text("failure mareason".tr()),
 
       Text(" : "),
            Expanded
            (child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(prov.stopreasons.text))),
 
     
    ],
  ),
 Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("fix time".tr()),

       Text(" : "),
             Text(prov.stopreasonstime.text),

     
    ],
  ),
Row(
        mainAxisAlignment: MainAxisAlignment.end,

    children: [
              Text("notes".tr()) ,
     Text(" : "),

Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal,child:prov.notes.text.isNotEmpty? Text(prov.notes.text):Text("notfound".tr()),)),
      
    ],
  ),
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm".tr(), height: 50, width: 70, onpressed:()async{

       maintenancemodel production=maintenancemodel(date: prov.date,engineer: cashhelper.getstringdata("user_name")!,machinename: prov.machinename.text
      ,shift: prov.shift!,stopreasons: prov.stopreasons.text,stopreasonstime: prov.stopreasonstime.text,notes: prov.notes.text);
    macmaintenanceservice.setdata(production,);
      prov.mold.clear();
      prov.stopreasons.clear();
      prov.stopreasonstime.clear();
      prov.notes.clear();
prov.machinename.clear();
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back".tr(), height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],);}}


