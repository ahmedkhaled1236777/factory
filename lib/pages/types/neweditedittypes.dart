import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/addeditdialog.dart';
import 'package:fac_app/widgets/addeditstypedialog.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class neweditedittypes extends StatelessWidget{
   GlobalKey<FormState>formkey3=GlobalKey<FormState>();
   GlobalKey<FormState>formkey4=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<typesprovider>(context);
    print(prov.typesname);
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           datebutton(onpressed: (){
                Provider.of<typesprovider>(context,listen: false).changedate(context);
                },date: Provider.of<typesprovider>(context).date),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: dropdownbutton(onchanged:(val){                  Provider.of<typesprovider>(context,listen: false).changedroptypes(val);
                  }, mo: prov.typesname, name:prov.typename, hint:"choose category".tr()),
                ),
             IconButton(onPressed: ()async{
 var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
               
                  if (res is String) {
prov.changetypeforscan(res)  ;               }

             }, icon: Icon(Icons.qr_code_scanner,color: appcolors.kprimarycolor,)) ],
            ),
Form(key: formkey3,child: textform(con: prov.edittypes, valid:"quantity cat error".tr(), hinttext: "category quatity".tr(), suffix: "", keyboardType:TextInputType.number)),
Form(key: formkey4,child: textform(con: prov.editpacket, valid: "Packaging type error".tr(), hinttext: "Packaging type".tr(), suffix: "", keyboardType:TextInputType.multiline))
,Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        addbutton(type: "subtract".tr(),fontsize: 25,padding: 10,width: 100,height: 50,onpressed: ()async{
                           if( Provider.of<typesprovider>(context,listen: false).checkdate(context)!=false);
                           else if( Provider.of<typesprovider>(context,listen: false).typename==null){
        showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose category".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
      }   

      else  if(formkey4.currentState!.validate()&&formkey3.currentState!.validate()){
          showDialog(context: context, builder: ((context) {
            return addedittypesdialog(status: "subtract cat quantity".tr(), typename: prov.typename!, quantity:-int.parse(prov.edittypes.text), type: "حذف",packet:prov.editpacket.text,barcode: prov.con.text,sectionname: "types",edittypename: "edittypes",);
          }))
        ;}
        }),
        addbutton(type: "add".tr(),fontsize: 25,padding: 10,width: 100,height: 50,onpressed: ()async{
                           if( Provider.of<typesprovider>(context,listen: false).checkdate(context)!=false);
                            else if( Provider.of<typesprovider>(context,listen: false).typename==null){
        showDialog(context: context, builder:((context) {
    return AlertDialog(
      title:Center(child: Text("please choose category".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],
    );
  }));
      }   

     else    if(formkey3.currentState!.validate()&&formkey4.currentState!.validate()){
      showDialog(context: context, builder: ((context) {
            return addedittypesdialog(status:"added category".tr(), typename: prov.typename!, quantity:int.parse(prov.edittypes.text), type: "اضافه",packet: prov.editpacket.text,barcode: prov.con.text,sectionname: "types",edittypename: "edittypes",);
          }));
         }
        }),
      
     
   
   ])]);
  }

}