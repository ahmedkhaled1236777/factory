import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/edits.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/services/material/editsservice.dart';
import 'package:fac_app/services/material/material.dart';
import 'package:fac_app/widgets/addeditdialog.dart';
import 'package:fac_app/widgets/gradient.dart';
import 'package:fac_app/widgets/materialdialog.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/materialprovider.dart';
import '../../providers/materialprovider.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';

class addmaterial extends StatelessWidget{
 String?type;
 List materialsname=[];
 GlobalKey<FormState>formkey1=GlobalKey<FormState>();
 GlobalKey<FormState>formkey2=GlobalKey<FormState>();
 GlobalKey<FormState>formkey3=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      var prov=Provider.of<materialprovider>(context);

    return Scaffold(
      
      appBar: AppBar(title: Text("add and edit material".tr(),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),
    body: gradients(
      child: SingleChildScrollView(
        child: Column(
          children: [
          
            SizedBox(height: 20,),
                          Text("add material".tr(),style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,)),
                           datebutton(onpressed: (){
                Provider.of<materialprovider>(context,listen: false).changedate(context);
                },date: Provider.of<materialprovider>(context).date,),
                          

            Form(key: formkey1,child: textform(con: prov.addmaterialname, valid: "material error".tr(), hinttext: "enter material".tr(), suffix: "", keyboardType: TextInputType.multiline)),
            Form(key: formkey2,child: textform(con: prov.addmaterials, valid: "quantity error".tr(), hinttext: "material quatity".tr(), suffix: "bag".tr(), keyboardType: TextInputType.number)),
                addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: ()async{
                       materialsname=await Provider.of<materialprovider>(context,listen: false).materialsname;

                 if( Provider.of<materialprovider>(context,listen: false).checkdate(context)!=false);
                  else  if(formkey1.currentState!.validate()&&formkey2.currentState!.validate()){
                    if(materialsname.contains(prov.addmaterialname.text))ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(("old material".tr()))));
                 else   showDialog(context: context, builder: ((context) {
                      return showmaterialdialog(status: "quantity",materialname: prov.addmaterialname.text,quantity: prov.addmaterials.text,);
                    }));
                   }
                }),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(width: double.infinity,height: 1,color: Colors.black,),
                ),
                                SizedBox(height: 35,),

              Text("edit old material".tr(),style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,)),
             
               SizedBox(height: 10,),
            dropdownbutton(onchanged:(val){                  Provider.of<materialprovider>(context,listen: false).changedropmaterial(val);
}, mo: prov.materialsname, name:prov.materialname, hint: "choose material".tr()),
Form(key: formkey3,child: textform(con: prov.editmaterials, valid: "quantity error".tr(), hinttext: "material quatity".tr(), suffix: "bag".tr(), keyboardType:TextInputType.number))
,Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        addbutton(type: "subtract",fontsize: 25,padding: 10,width: 100,height: 50,onpressed: ()async{
                           if( Provider.of<materialprovider>(context,listen: false).checkdate(context)!=false);
                            else if( Provider.of<materialprovider>(context,listen: false).materialname==null){
        showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose material".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
      }      

      else  if(formkey3.currentState!.validate()){
          showDialog(context: context, builder: ((context) {
            return addeditdialog(status: "subtract quantity", materialname: prov.materialname!, quantity:-int.parse(prov.editmaterials.text), type: "حذف");
          }))
        ;}
        }),
        addbutton(type: "add",fontsize: 25,padding: 10,width: 100,height: 50,onpressed: ()async{
                           if( Provider.of<materialprovider>(context,listen: false).checkdate(context)!=false);
      else if( Provider.of<materialprovider>(context,listen: false).materialname==null){
        showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose material".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
      }                     

     else    if(formkey3.currentState!.validate()){
      showDialog(context: context, builder: ((context) {
            return addeditdialog(status: "add material", materialname: prov.materialname!, quantity:int.parse(prov.editmaterials.text), type: "اضافه");
          }));
         }
        }),
  ],
),
              
      
      
          ],
        ),
      ),
    ),
    );
  }

}

 Future<String> chagedate(BuildContext context)async{
    String date;

  DateTime? pickeddate=await showDatePicker( initialDate: DateTime.now(), 
  firstDate: DateTime(2000), lastDate: DateTime(2100), context:context ); 
   date=formatDate(pickeddate!, [d,"/",m,"/",yyyy]);
   return date;
 }