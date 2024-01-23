import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/types/edittype.dart';
import 'package:fac_app/models/types/modeltype.dart';
import 'package:fac_app/services/types/edittypes.dart';
import 'package:fac_app/services/types/typessevice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';

class typesprovider extends ChangeNotifier{
  TextEditingController addtypes=TextEditingController();
  TextEditingController addtypename=TextEditingController();
  TextEditingController edittypes=TextEditingController();
  TextEditingController packet=TextEditingController();
  TextEditingController editpacket=TextEditingController();
  TextEditingController con=TextEditingController();
     int x=(Random().nextInt(1000))+1000;

  onchanged(val){
x=int.parse(val);
notifyListeners();
  }

initcon(){
x=(Random().nextInt(1000))+1000;  
 con=TextEditingController(text: x.toString());
   notifyListeners();

}
changeallvalues(val){
  x=int.parse(val);
  con=TextEditingController(text: val);
  notifyListeners();
  
  }
List<typemodel>reports=[];
 bool containerwidth=false;
  changecontainercondition(){
  containerwidth==true?containerwidth=false:containerwidth=true;
    notifyListeners();
  }
  int counter=0;
  List<typemodel> filterdata=[];
searchformaterial(value){
 filterdata= reports.where((element) => element.type.startsWith(value)).toList();
 notifyListeners();

}
searchformaterialscanner(value){
 filterdata= reports.where((element) => element.barcode.startsWith(value)).toList();
 notifyListeners();

}
changetypeforscan(String val){
  typename=types[val];
  notifyListeners();

}
List typesname=[];
     List<edittypemodel> editreports = [];
Map types={};
  String? typename;
   changedroptypes(value){
  typename=value;
  notifyListeners();
}
    String date="";

 changedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 resetreportsdata(){
    reports=[];
    notifyListeners();}
 resetmaterialname(){
  typename=null;
    notifyListeners();}
 reseteditreportsdata(){
    editreports=[];
    notifyListeners();}
 resetmaterialsnamedata(){
    typesname=[];
    notifyListeners();}
 reportsdata()async{
  reports=await typesservice.getdata(sectionname: "types");
  notifyListeners();
 }
 editreportsdata(String data,)async{
  editreports=await edittypesservice.getdata(data,"edittypes");
  notifyListeners();
 }
 typesnamesdata({String ?factory_id})async{
  typesname=[];
  types=await typesservice.gettypesnamesdata(sectionname: "types");
  types.entries.forEach((e)=>typesname.add(e.value));
  notifyListeners();
 }

 resetdate(){
  date="choose date";
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




}  

