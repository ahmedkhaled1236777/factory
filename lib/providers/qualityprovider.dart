import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/quality/quality.dart';
import 'package:fac_app/services/quality/quality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/removeoradd.dart';

class qualityprovider extends ChangeNotifier{
List<qualitymodel>reports=[];
    String ?shift;
 TextEditingController machinename=TextEditingController();
 TextEditingController notes=TextEditingController();
  TextEditingController product=TextEditingController();
  TextEditingController defaul=TextEditingController();
  TextEditingController checktime=TextEditingController();
  
    String date="";
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
 

 changedropshift(value){
  shift=value;
  notifyListeners();
}
resetdatashift(){
  shift=null;
  notifyListeners();
}
checkdate(BuildContext context){
  if(date=="") showDialog(context: context, builder:((context) {
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
resetreportsdata(){
    reports=[];
    notifyListeners();}
reportsdata(String date,String shift,)async{
  reports=await qualityservice.getdata(date,shift);
  notifyListeners();
 }







}