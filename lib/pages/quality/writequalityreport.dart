import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/quality/quality-page.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/dialogquality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/qualityprovider.dart';
import '../../widgets/blowdialog.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';
import '../../widgets/textform.dart';

class writequalityreport extends StatelessWidget{
    GlobalKey<FormState> formkey=GlobalKey<FormState>();
var time=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<qualityprovider>(context);
    
    return Scaffold( appBar: AppBar(title:Text("write quality  reports".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      body: gradients(
        child: SafeArea(child: 
        
         SingleChildScrollView(
           child: Form(
            key: formkey,
             child: Column(
                children: [
                 
                datebutton(onpressed: (){
                Provider.of<qualityprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<qualityprovider>(context).date,),
               
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<qualityprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<qualityprovider>(context).shift,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                                            Text("check time".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                     Text(" : "),

                     Text(time.hour>12?" (${(time.hour-12).abs()}:${time.minute.abs()}) ":"(${(time.hour-12).abs()}:${time.minute})",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                           Text(time.hour>12?"pm".tr():"am".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),

                    ],
                  ),
                textform(con: prov.machinename, valid:"mac error".tr(), hinttext: "machine".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                
                
                textform(con: prov.product, valid: "product error".tr()
                , hinttext: "product name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                textform(con: prov.defaul, valid: "defect error".tr()
                , hinttext: "defect name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
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
         
               Padding(
                 padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                 
                 ),
               
                       addbutton(type: "save".tr(),fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
                 if( Provider.of<qualityprovider>(context,listen: false).checkdate(context)!=false);
                 else if( Provider.of<qualityprovider>(context,listen: false).checkshift(context)!=false);
                 else if (formkey.currentState!.validate()==false){
                                                         
           
                  }
                  else{
                  showDialog(context: context, builder:((context) {
                    return showqualitydialog();
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