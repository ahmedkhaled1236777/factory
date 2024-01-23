import 'package:date_format/date_format.dart';
import 'package:fac_app/models/finish/finish.dart';
import 'package:fac_app/services/finishservices/finishservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class showfinishprovider extends ChangeNotifier{
  String ?shift;
List <finishmodel>reports=[];
late String date;
 chagedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 resetdatashift(){
  shift=null;
  notifyListeners();
}
resetreportsdata(){
    reports=[];
    notifyListeners();}
reportsdata(String date,String shift)async{
  reports=await finishservice.getdata(date,shift,);
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
}
