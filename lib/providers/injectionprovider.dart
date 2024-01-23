import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/injection/production.dart';
import '../services/injectionservices/injectionservices.dart';

class injectionprovider extends ChangeNotifier{
  String? machinename;
  injectionservice servicer=injectionservice();
  List <productionmodel> model=[];
  String ?shift;
  
  TextEditingController worker=TextEditingController();
  TextEditingController mold=TextEditingController();
  TextEditingController production_quantity=TextEditingController();
  TextEditingController scrapquantity=TextEditingController();
  TextEditingController cycle_time=TextEditingController();
  TextEditingController stopreasons=TextEditingController();


  String? date;
 chagedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 
 resetdate(){
  date="choose date";
  notifyListeners();
 }
 changedropmachine(value){
  machinename=value;
  notifyListeners();
}
resetdatamachine(){
  machinename=null;
  notifyListeners();
}
 changedropshift(value){
  shift=value;
  notifyListeners();
}
resetdatashift(){
  shift=null;
  notifyListeners();
}
checkdate(BuildContext context){
  if(date=="choose date") showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose date".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily),)),
      
      actions: [
        Center(child: addbutton(type: "ok" ,height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}
checkmachine(BuildContext context){
  if(machinename==null) showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose machine".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily))),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}
checkshift(BuildContext context){
  if(shift==null) showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose shift".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily))),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}

 
}
