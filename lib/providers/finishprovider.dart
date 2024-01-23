import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/finish/finish.dart';
import 'package:fac_app/services/finishservices/finishservice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class finishprovider extends ChangeNotifier{
  
  String ?shift;
List <finishmodel> finish=[];
finishservice servicer=finishservice();

  TextEditingController engineer=TextEditingController();
  TextEditingController worker=TextEditingController();
  TextEditingController jop=TextEditingController();
  TextEditingController production_quantity=TextEditingController();

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
