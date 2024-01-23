

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/maintenancemolddialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/maintenanceprovider.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/maintenancedialog.dart';
import '../../widgets/removeoradd.dart';
import '../../widgets/textform.dart';

class moldmaintenancereport extends StatelessWidget{
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<maintenceprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("mold maintenance".tr(),style: TextStyle(fontSize: 20,))),
      body: SafeArea(child: 
      
       SingleChildScrollView(
         child: gradients(
           child: Form(
            key: formkey,
             child: Column(
                children: [
                datebutton(onpressed: (){
                Provider.of<maintenceprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<maintenceprovider>(context).date,),
            
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<maintenceprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<maintenceprovider>(context).shift,),
                textform(con: prov.mold, valid:"mold error".tr(), hinttext: "mold name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
               Padding(
                 padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                 child: TextFormField(
                  controller: prov.stopreasons,
                  validator: (value) {
                    if(value!.isEmpty)return "default error".tr();
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                  
            prefixStyle: TextStyle(),
            labelStyle: TextStyle(fontSize:25,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "failure mareason".tr(),
         
            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            contentPadding: EdgeInsets.only(left:10,right: 10,top: 10)
                 ),
                  
                 ),
               ),
                             textform(con: prov.stopreasonstime, valid:"fix error".tr(), hinttext: "fix time".tr(), suffix:"minute".tr(),keyboardType: TextInputType.multiline,),
                                   Padding(
                                     padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                     child: TextFormField(
                controller: prov.notes,
                maxLines: 5,
                decoration: InputDecoration(
                
            prefixStyle: TextStyle(),
            labelStyle: TextStyle(fontSize:25,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "notes".tr(),
           
         
            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            contentPadding: EdgeInsets.only(left:10,right: 10,top: 10)
                 )),
                                   ),
         
                
               
                addbutton(type: "save".tr(),fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
                 if( Provider.of<maintenceprovider>(context,listen: false).checkdate(context)!=false);
                 else if( Provider.of<maintenceprovider>(context,listen: false).checkshift(context)!=false);
                 else if (formkey.currentState!.validate()==false){
                                                         
         
                  }
                  else{
                  showDialog(context: context, builder:((context) {
                    return molddialog();
                  }));
                }
         },),SizedBox(height: 300,)
                
                  
                ],
              ),
           ),
         ),
       ),
      )
    );
  }
}