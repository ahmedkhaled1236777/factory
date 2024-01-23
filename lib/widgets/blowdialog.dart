import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/injection/production.dart';
import 'package:fac_app/pages/login/login.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/services/blowservices/blowservices.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/blowprovider.dart';

class showblowdialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<blowprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),

titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.start,
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
            Text("machine name".tr()),
             Text(" : "),

      Text(prov.machinename.toString()),

      
    ],
  ),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("mold name".tr()),
             Text(" : "),

      Text(prov.mold.text),

      
    ],
  ),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [

      Text("cycle time".tr()),
                   Text(" : "),

            Text(prov.cycle_time.text),

      
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
        mainAxisAlignment: MainAxisAlignment.start,

    children: [

      Text("scrap qyantity".tr()),
                   Text(" : "),

            Text(prov.scrapquantity.text),

      
    ],
  ),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [

      Text("machine malfunctions".tr()),
                   Text(" : "),

            Expanded(child: Text(prov.stopreasons.text,textAlign: TextAlign.start,)),

    ],
  ),
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm".tr(), height: 50, width: 100, onpressed:()async{
      
        
      
      productionmodel production=productionmodel(date: prov.date,engineer: cashhelper.getstringdata("user_name"),cycle_time: prov.cycle_time.text,worker: prov.worker.text,machinename: prov.machinename!
      ,shift: prov.shift!,production:int.parse(prov.production_quantity.text),
      scrap:int.parse(prov.scrapquantity.text),stopreason: prov.stopreasons.text,mold: prov.mold.text); 
      blowservice.setdata(production,)     ;
      prov.resetdatamachine();
      prov.cycle_time.clear();
      prov.mold.clear();
      prov.production_quantity.clear();
      prov.scrapquantity.clear();
      prov.stopreasons.clear();
      prov.worker.clear();
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back".tr(), height: 50, width: 100, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );
  }









}