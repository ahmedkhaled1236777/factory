import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/finish/finish.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/services/finishservices/finishservice.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/finishprovider.dart';

class showfinishdialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<finishprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding:context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
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
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("worker-name".tr()),

       Text(" : "),
             Text(prov.worker.text),

     
    ],
  ),
 Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("job".tr()),

       Text(" : "),
             Text(prov.jop.text),

     
    ],
  ),
 
 
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("production qyantity".tr()),
             Text(" : "),

      Text(prov.production_quantity.text),

      
    ],
  ),
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm".tr(), height: 50, width: 70, onpressed:()async{
       var pref =await SharedPreferences.getInstance();
     
       finishmodel production=finishmodel(date: prov.date,engineer: cashhelper.getstringdata("user_name"),worker: prov.worker.text
      ,shift: prov.shift!,production:int.parse(prov.production_quantity.text),job: prov.jop.text);
    finishservice.setdata(production,);
      prov.production_quantity.clear();
      prov.jop.clear();
      prov.worker.clear(); 
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back".tr(), height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );
  }









}