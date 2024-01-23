import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/types/edittype.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/services/types/edittypes.dart';
import 'package:fac_app/services/types/typessevice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addedittypesdialog extends StatelessWidget{
final String status;
final String typename;
final int quantity;
final String type;
final String packet;
final String barcode;
final String sectionname;
final String edittypename;


  const addedittypesdialog({super.key, required this.status, required this.edittypename,required this.sectionname,required this.typename, required this.quantity, required this.packet,required this.type,required this.barcode});
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<typesprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
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
              Text("${status}".tr()),
              Text(" : "),
        Text(quantity.abs().toString()),
        SizedBox(width: 5,),
    
        Text(packet),
        
      ],
    ),
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
        try{

                               await  typesservice.update(quantity, typename,sectionname);
                               await edittypesservice.setdata(edittypemodel(engineer:cashhelper.getstringdata("user_name"), date: prov.date, quantity:quantity, type: type,packet: packet,typename: typename),edittypename);
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تمت العمليه بنجاح")));
                               prov.edittypes.clear();
                               prov.editpacket.clear();

            }catch(e){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("يوجد خطاء برجاء المحاوله مره اخري")));
 
            }

      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );}}