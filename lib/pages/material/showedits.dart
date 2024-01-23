import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/edits.dart';
import 'package:fac_app/pages/material/editsreports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/materialprovider.dart';
import '../../widgets/containermaterial.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';

class showedits extends StatelessWidget{
  List<editmaterialmodel> data=[];
  

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("show modifications".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
        
      ),
      body: gradients(
        child: Column(
          children: [
             datebutton(onpressed: (){
                  Provider.of<materialprovider>(context,listen: false).changedate(context);
                  },date: Provider.of<materialprovider>(context).date,),
                   addbutton(type: "show".tr(), height: 50, width: double.infinity, onpressed:()async{
                  if(prov.date=="choose date"){showDialog(context: context, builder: ((context) {
                    return AlertDialog(title:Center(child: Text("please choose date".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],);
                  }));}
                  else{ 
                   
          await prov.editreportsdata(prov.date,);
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                    return editreports();
                  })));
                  
                  }
                 
                }, fontsize: 25, padding: 5),
                 
          ],
        ),
      ),
    );
  }

}