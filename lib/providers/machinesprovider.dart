import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/machines/machinesmodel.dart';
import 'package:fac_app/services/machines.dart/machinesservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/removeoradd.dart';

class machinesprovider extends ChangeNotifier{
List departements=["injection-departement","blow-departement"];
String?departementname;
List<machinesmodel> injectionmachines=[];
List injectionmachine=[];
List blowingmachine=[];
List<machinesmodel> blowingmachines=[];
TextEditingController machinename=TextEditingController();
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
      title:Center(child: Text("departement error"
      .tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
  else return false;
  notifyListeners();
}

getinjectionmachines()async{
   injectionmachine=[];

injectionmachines=await machinesservice.getdata("injection machines");
notifyListeners();

for (var element in injectionmachines) {
  injectionmachine.add(element.name);
  
}

}
getblowingmachines()async{
  blowingmachine=[];
blowingmachines=await machinesservice.getdata("blowing machines");
notifyListeners();
for (var element in blowingmachines) {
  blowingmachine.add(element.name);
  
}

}















}