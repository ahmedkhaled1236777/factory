import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/services/injectionservices/injectionservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/injection/production.dart';

class showinjectionprovider extends ChangeNotifier{
  String ?shift;
    List<productionmodel> reports=[];



  String ?date;
 chagedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 reportsdata(String date,String shift)async{
  reports=await injectionservice.getdata(date,shift);
  notifyListeners();
 }
 resetreportsdata(){
  reports=[];
  notifyListeners();
 }
 resetdatashift(){
  shift=null;
  notifyListeners();
}
 resetdate(){
  date= "choose date";
  notifyListeners();
 }
  changedropshift(value){
  shift=value;
  notifyListeners();
}






}