import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/machines/machinesmodel.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/services/machines.dart/machinesservice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class machinesdialog extends StatelessWidget{
bool found=false;

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<machinesprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding:  context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
actions: [
 
  
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("departement name".tr()),
      Text(" : "),
       Expanded(child: Text(prov.departementname!,overflow: TextOverflow.ellipsis,)),
     
    ],
  ),
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("machine".tr()),
      Text(" : "),
      Text(prov.machinename.text),
    
    ],
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
        try{

         
await prov.getinjectionmachines();
await prov.getblowingmachines();
for (var element in prov.departementname=="injection-departement"?prov.injectionmachines:prov.blowingmachines) {
  if(element.name==prov.machinename.text){found=true;break;}
  
}
if(found==true)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("old machine".tr() )));
                    else{await machinesservice.setdata(machinesmodel(name: prov.machinename.text), prov.departementname=="injection-departement"?"injection machines":"blowing machines",);
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("good job".tr())));
                               prov.machinename.clear();}           

            }catch(e){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There was an error please try again".tr())));
 
            }

      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );}}