import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/maintenance/moldreport.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/maintenanceprovider.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';

class showmoldmaintenancereport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<maintenceprovider>(context);
    return Scaffold(
      appBar:AppBar(title:Text("mold maintenance".tr(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ),) ,
      body: SafeArea(child: gradients(
        child: Column(
          children: [
            datebutton(onpressed: (){
                Provider.of<maintenceprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<maintenceprovider>(context).date,),
                 dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<maintenceprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<maintenceprovider>(context).shift,),
                  addbutton(type:  "show".tr(), height: 50, width: double.infinity, onpressed:()async{
                  if(prov.date=="choose date"||prov.shift==null){showDialog(context: context, builder: ((context) {
                    return AlertDialog(content: Text("show error".tr()),actions: [Center(child: MaterialButton(color: Colors.blue,onPressed: (){Navigator.pop(context);},child: Text("ok".tr(),style: TextStyle(color: Colors.white),),))]);
                  }));}
                  else{ 
                    var pref =await SharedPreferences.getInstance();
                    String? factory_id=pref.getString("factory-id");
                     String? user_name=pref.getString("user-name");
          await prov.reportsmolddata(prov.date,prov.shift!,factory_id: factory_id);
                   Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                    return molreports();
                  })));
                  
                  }
                 
                }, fontsize: 25, padding: 5),
                
                
          ]),
      )
      
      
      ),
    );}}