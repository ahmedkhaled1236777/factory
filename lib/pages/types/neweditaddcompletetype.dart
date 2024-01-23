import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/providers/completetypesprovider.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/showcompletetypedialog.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:fac_app/widgets/typesdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class neweditaddcompletetypes extends StatefulWidget{
  @override
  State<neweditaddcompletetypes> createState() => _neweditaddcompletetypesState();
}

class _neweditaddcompletetypesState extends State<neweditaddcompletetypes> {
     GlobalKey<FormState>formkey1=GlobalKey<FormState>();

   GlobalKey<FormState>formkey2=GlobalKey<FormState>();

 GlobalKey<FormState>formkey3=GlobalKey<FormState>();

 List materialsname=[];
@override
  void initState() {
   Future.delayed(Duration.zero,(){           Provider.of<completetypesprovider>(context,listen: false).initcon();
}) ; }
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<completetypesprovider>(context);
  return SingleChildScrollView(
    child: Column(
      children: [
         datebutton(onpressed: (){
                  Provider.of<completetypesprovider>(context,listen: false).changedate(context);
                  },date: Provider.of<completetypesprovider>(context).date),
                            
      Container(
              padding: EdgeInsets.all(10),
              child: BarcodeWidget(
            barcode: Barcode.code93(), // Barcode type and settings
            data: Provider.of<completetypesprovider>(context).x.toString(), // Content
            width: 200,
            height: 200,
                    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
                
              ),
              width: 200,
              height: 100,
            ),
              Row(
                children: [
                  Expanded(child: textform(onChanged:(value){
                   Provider.of<completetypesprovider>(context,listen: false).onchanged(value);
                  },con: Provider.of<completetypesprovider>(context).con, valid: "", hinttext: "", suffix: "", keyboardType: TextInputType.number)),
                  IconButton(onPressed: ()async{
                   var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
               
                  if (res is String&&res!="-1") {
Provider.of<completetypesprovider>(context,listen: false).changeallvalues(res)   ;               }
               
                  }, icon: Icon(Icons.document_scanner,color: appcolors.kprimarycolor,))
                ],
              ),
              Form(key: formkey1,child: textform(con: prov.addtypename, valid: "category error".tr(), hinttext: "enter category".tr(), suffix: "", keyboardType: TextInputType.multiline)),
              Form(key: formkey2,child: textform(con: prov.addtypes, valid: "quantity cat error".tr(), hinttext: "category quatity".tr(), suffix: "", keyboardType: TextInputType.number)),
              Form(key: formkey3,child: textform(con: prov.packet, valid: "Packaging type error".tr(), hinttext: "Packaging type".tr(), suffix: "", keyboardType: TextInputType.multiline)),
                  addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: ()async{
                         materialsname=await Provider.of<completetypesprovider>(context,listen: false).typesname;
    
                   if( Provider.of<completetypesprovider>(context,listen: false).checkdate(context)!=false);
                    else  if(formkey1.currentState!.validate()&&formkey2.currentState!.validate()&&formkey3.currentState!.validate()){
                      if(materialsname.contains(prov.addtypename.text))ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(("please choose date".tr()))));
                   else   showDialog(context: context, builder: ((context) {
                        return showcompletetypesdialog(status: "category quatity".tr(),typename: prov.addtypename.text,quantity: prov.addtypes.text,packet: prov.packet.text,barcode:  prov.con.text,);
                      }));
                     }
                  }),
      ],
     ),
  );
  }
}