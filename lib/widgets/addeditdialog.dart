import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/services/material/editsservice.dart';
import 'package:fac_app/services/material/material.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/material/edits.dart';
import '../models/material/material.dart';
import '../providers/materialprovider.dart';

class addeditdialog extends StatelessWidget{
final String status;
final String materialname;
final int quantity;
final String type;

  const addeditdialog({super.key, required this.status, required this.materialname, required this.quantity, required this.type});
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
actions: [
 
  
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("material name".tr()),
Text(" : "),
       Text(materialname),
    
    ],
  ),
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("${status}".tr()),
      Text(" : "),

      Text(quantity.abs().toString()),
      
    ],
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
        try{

                               await  materialservice.update(quantity, materialname,);
                               await editsmaterial.setdata(editmaterialmodel(engineer:cashhelper.getstringdata("user_name"), date: prov.date, material: materialname, quantity:quantity, type: type),);
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("good job".tr())));
                               prov.editmaterials.clear();
                                  

            }catch(e){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There was an error please try again".tr())));
 
            }

      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );}}