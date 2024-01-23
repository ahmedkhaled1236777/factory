import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/shift/shift.dart';
import 'package:fac_app/services/shifts/shitsservices.dart';
import 'package:flutter/material.dart';

import '../widgets/removeoradd.dart';

class shiftsprovider extends ChangeNotifier{
List departements=["injection-departement","blow-departement","finish-departement","maintenance-departement","quality-departement"];
String?departementname;
List<shiftmodel> shifts=[];
List shift=[];

TextEditingController shiftname=TextEditingController();
resetdepartementname(){
  departementname=null;
}
changedropdepartement(value){
  departementname=value;
  notifyListeners();
}
checkdepartement(BuildContext context){
  if(departementname==null) showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("departement error".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}

getshifts({required String departementname})async{
   shifts=[];
shift=[];
shifts=await shiftservice.getdata(departementname:departementname );
notifyListeners();

for (var element in shifts) {
  shift.add(element.shift);
  
}

}



}
