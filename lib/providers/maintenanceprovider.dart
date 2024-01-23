import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/maintenance/maintenance.dart';
import 'package:fac_app/services/maintenanceservice/macmaintenanceservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/removeoradd.dart';

class maintenceprovider extends ChangeNotifier{
  String ?shift;
  List<maintenancemodel>reports=[];
  List<maintenancemodel>moldreports=[];
  TextEditingController machinename=TextEditingController();
  TextEditingController mold=TextEditingController();
  TextEditingController stopreasons=TextEditingController();
  TextEditingController stopreasonstime=TextEditingController();
  TextEditingController notes=TextEditingController();

  String date="";
 chagedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 resetreportsdata(){
    reports=[];
    notifyListeners();}
 resetmoldreportsdata(){
    moldreports=[];
    notifyListeners();}
reportsdata(String date,String shift,)async{
  reports=await macmaintenanceservice.getdata(date,shift,);
  notifyListeners();
 }
reportsmolddata(String date,String shift,{String ?factory_id})async{
  moldreports=await macmaintenanceservice.getmolddata(date,shift,);
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
      title:Center(child: Text("please choose date".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}
checkmachine(BuildContext context){
  if(machinename==null) showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose machine".tr())),
      
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
      title:Center(child: Text("please choose shift".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}

 
}


