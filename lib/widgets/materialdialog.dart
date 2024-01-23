import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/services/material/material.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class showmaterialdialog extends StatelessWidget{
final String status;
final String materialname;
final String quantity;

  const showmaterialdialog({super.key, required this.status, required this.materialname, required this.quantity});
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding:  context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.start,
actions: [
 
  
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("material name".tr() ),
       Text(" : "),
       Text(materialname),

     
    ],
  ),
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("${status}".tr()),
      Text(" : "),

      Text(quantity),
      
    ],
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
     
      
      materialmodel production=materialmodel(date: prov.date,engineer: cashhelper.getstringdata("user_name")!,material: prov.addmaterialname.text,quantity: int.parse(prov.addmaterials.text)); 
      materialservice.setdata(production)     ;
      
          await prov.materialnamesdata();
     prov.addmaterialname.clear();
     prov.addmaterials.clear();
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );
  }









}