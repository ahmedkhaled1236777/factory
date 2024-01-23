import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/quality/quality.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/services/quality/quality.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class showqualitydialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<qualityprovider>(context);
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
            Text("machine".tr()),

       Text(" : "),
             Text(prov.machinename.text),

     
    ],
  ),
 Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("product name".tr()),

       Text(" : "),
             Text(prov.product.text),

     
    ],
  ),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("defect name".tr()),

       Text(" : "),
             Text(prov.defaul.text),

     
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
      var pref =await SharedPreferences.getInstance();
     String? factory_id=pref.getString("factory-id");
     String? user_name=pref.getString("user-name");
     String? engineer;
    await FirebaseAuth.instance.userChanges().listen((User?user){if(user!=null){engineer="admin";}else {engineer=user_name;}});
       qualitymodel production=qualitymodel(date: prov.date,engineer: engineer!,machinename: prov.machinename.text
      ,shift: prov.shift!,
    defaul: prov.defaul.text,notes: prov.notes.text,productname: prov.product.text,timehour:DateTime.now().hour.toInt(),timeminite: DateTime.now().minute.toInt() );
    qualityservice.setdata(production, factory_id: factory_id);
     prov.machinename.clear();
      prov.product.clear();
      prov.notes.clear();
      prov.defaul.clear();
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back".tr(), height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );
  }









}