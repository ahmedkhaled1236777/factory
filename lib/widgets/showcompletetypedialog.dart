import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/types/modeltype.dart';
import 'package:fac_app/providers/completetypesprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/services/types/typessevice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class showcompletetypesdialog extends StatelessWidget{
final String status;
final String typename;
final String quantity;
final String packet;
final String barcode;

  const showcompletetypesdialog({super.key, required this.status, required this.typename, required this.quantity,required this.packet,required this.barcode});
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<completetypesprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.start,
actions: [
 
  
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("category name".tr()),
      Text(" : "),
       Text(typename),
     
    ],
  ),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("barcode".tr()),
      Text(" : "),
       Text(barcode),
     
    ],
  ),
 
  SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
    
      children: [
              Text("${status}"),
              Text(" : "),
        Text(quantity),
    SizedBox(width: 5,),
    
              Text(packet),
        
      ],
    ),
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
     
      
      typemodel production=typemodel(barcode: prov.con.text,date: prov.date,engineer: cashhelper.getstringdata("user_name")!,type: prov.addtypename.text,quantity: int.parse(prov.addtypes.text),packet: packet); 
      typesservice.setdata(production,"complete types")     ;
      
          await prov.typesnamesdata();
     prov.addtypename.clear();
     prov.packet.clear();
    prov.addtypes.clear();
      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );
  }









}