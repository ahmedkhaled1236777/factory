import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/services/attendance/attendanceservice.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';

class attendanceprovider extends ChangeNotifier{
  String date="";
  String?departementname;
  List<String> names=[];

  List<String> status=[];
changestatus(int i,String  value){
  status[i]=value;
  notifyListeners();
}

  namesofdepartement()async{
     names=await attendanceservice.getdata(departementname!);
              status.clear();
                for (var element in names) {
                  status.add("حضور");
                }
                notifyListeners();
  }
 List <String>departements=["injection-departement","blow-departement","finish-departement","maintenance-departement","quality-departement","store-departement","calculations-departement","security-departement","mangement-departement"];
 chagedate(BuildContext context)async{
  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
  notifyListeners();
 }
 checkdate(BuildContext context,String status){
  if(date==status) showDialog(context: context, builder:((context) {
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
resetdepartement(){
  departementname=null;
  notifyListeners();
}
 resetdate(String status){
  date=status;
  notifyListeners();
 }
 changedropdepartement(value){
  departementname=value;
  notifyListeners();
}
resetattendance(){
  names.clear();
  status.clear();
  notifyListeners();
}
}
