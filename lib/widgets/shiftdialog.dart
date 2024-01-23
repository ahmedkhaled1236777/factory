import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/shift/shift.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/services/shifts/shitsservices.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class shiftdialog extends StatelessWidget{
bool found=false;

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<shiftsprovider>(context);
   return AlertDialog(
title:Text("data review".tr()),
titlePadding: context.locale==Locale("ar") ?EdgeInsets.only(right: 80):EdgeInsets.only(left: 80),
alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.end,
actions: [
 
  
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
            Text("departement name".tr(),),
            Text(" : "),

       Expanded(child: Text(prov.departementname!.tr(),overflow: TextOverflow.ellipsis,)),
     
    ],
  ),
 
  Row(
        mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Text("shift name".tr()),
      Text(" : "),
      Text(prov.shiftname.text),
    
    ],
  ),
 
  Row(
      mainAxisAlignment:MainAxisAlignment.center,

    children: [
    addbutton(type: "confirm", height: 50, width: 70, onpressed:()async{
        try{
          
          await prov.getshifts(departementname: prov.departementname!);
          prov.shift.contains(prov.shiftname.text)==false?

await shiftservice.setdata(shiftmodel(shift: prov.shiftname.text, departementname: prov.departementname!)):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("هذه الورديه موجوده بالفعل")));
            }catch(e){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("يوجد خطاء برجاء المحاوله مره اخري")));
 
            }

      Navigator.pop(context);
    },fontsize: 15,padding: 5, ),
    addbutton(type: "back", height: 50, width: 70, onpressed:(){Navigator.pop(context);},fontsize: 15,padding: 5, )
  ],)
 
],










   );}}