import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/widgets/addeditdialog.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class neweditedit extends StatelessWidget{
   GlobalKey<FormState>formkey3=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           datebutton(onpressed: (){
                Provider.of<materialprovider>(context,listen: false).changedate(context);
                },date: Provider.of<materialprovider>(context).date),
        dropdownbutton(onchanged:(val){                  Provider.of<materialprovider>(context,listen: false).changedropmaterial(val);
}, mo: Provider.of<materialprovider>(context).materialsname, name:Provider.of<materialprovider>(context).materialname, hint: "choose material".tr()),
Form(key: formkey3,child: textform(con: Provider.of<materialprovider>(context).editmaterials, valid: "quantity error".tr(), hinttext: "material quatity".tr(), suffix: "bag".tr(), keyboardType:TextInputType.number))
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
            return addeditdialog(status: "subtract quantity", materialname: Provider.of<materialprovider>(context).materialname!, quantity:-int.parse(Provider.of<materialprovider>(context).editmaterials.text), type: "حذف");
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
            return addeditdialog(status: "add material", materialname: Provider.of<materialprovider>(context).materialname!, quantity:int.parse(Provider.of<materialprovider>(context).editmaterials.text), type: "اضافه");
          }));
         }
        }),
      
     
   
   ])]);
  }

}