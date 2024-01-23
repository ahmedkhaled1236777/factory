import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/services/maintenanceservice/macmaintenanceservice.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/maintenance/maintenance.dart';
import '../providers/maintenanceprovider.dart';

class molddialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<maintenceprovider>(context);
   return AlertDialog(
title:Text("data review".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily),),
titlePadding:context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
actions: [
   Row(
    
    mainAxisAlignment: MainAxisAlignment.start,
    children: [


                   Text("date".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),
                   Text(" : "),
                   
                                Text(prov.date,style: TextStyle(fontFamily: apptexts.appfonfamily)),


     
    ],),
     Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("mold name".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),

       Text(" : "),
             Text(prov.mold.text),

     
    ],
  ),
 
  
  Row(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children: [


                   Text("failure mareason".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),
                   Text(" : "),
                   
                                Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(prov.stopreasons.text,style: TextStyle(fontFamily: apptexts.appfonfamily)))),


     
    ],),
 
 
 Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("fix time".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),

       Text(" : "),
             Text(prov.stopreasonstime.text,style: TextStyle(fontFamily: apptexts.appfonfamily)),

     
    ],
  ),
 
 
  
  
Row(
        mainAxisAlignment: MainAxisAlignment.end,

    children: [
              Text("notes".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)) ,
     Text(" : "),

      Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal,child:prov.notes.text.isNotEmpty? Text(prov.notes.text):Text("notfound".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),)),

      
    ],
  ),
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm".tr(), height: 50, width: 70, onpressed:()async{

       maintenancemodel production=maintenancemodel(date: prov.date,engineer: cashhelper.getstringdata("user_name"),machinename: prov.mold.text
      ,shift: prov.shift!,stopreasons: prov.stopreasons.text,stopreasonstime: prov.stopreasonstime.text,notes: prov.notes.text);
      macmaintenanceservice.setmolddata(production, );

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
