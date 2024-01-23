import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/services/material/editsservice.dart';
import 'package:fac_app/services/material/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/material/edits.dart';
import '../widgets/removeoradd.dart';

class materialprovider extends ChangeNotifier{
  bool containerwidth=false;
  changecontainercondition(){
  containerwidth==true?containerwidth=false:containerwidth=true;
    notifyListeners();
  }
  int counter=0;
  List<materialmodel> filterdata=[];
searchformaterial(value){
 filterdata= reports.where((element) => element.material.startsWith(value)).toList();
 notifyListeners();

}
  resetcounter(){
    counter=0;
    notifyListeners();
  }
  increascounter(){
    counter++;
    notifyListeners();
  }
  TextEditingController addmaterials=TextEditingController();
  TextEditingController addmaterialname=TextEditingController();
  TextEditingController editmaterials=TextEditingController();
List<materialmodel>reports=[];
List materialsname=[];
     List<editmaterialmodel> editreports = [];

  String? materialname;
   changedropmaterial(value){
  materialname=value;
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
  materialname=null;
    notifyListeners();}
 reseteditreportsdata(){
    editreports=[];
    notifyListeners();}
 resetmaterialsnamedata(){
    materialsname=[];
    notifyListeners();}
 reportsdata()async{
  reports=await materialservice.getdata();
  notifyListeners();
 }
 editreportsdata(String date,)async{
  editreports=await editsmaterial.getdata(date,);
  notifyListeners();
 }
 materialnamesdata({String ?factory_id})async{
  materialsname=await materialservice.getmaterialsnamesdata();
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