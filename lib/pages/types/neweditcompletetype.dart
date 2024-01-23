import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/types/neweditaddcompletetype.dart';
import 'package:fac_app/pages/types/newediteditcomletetype.dart';
import 'package:fac_app/providers/completetypesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class neweditcompletetypes extends StatefulWidget{
  @override
  State<neweditcompletetypes> createState() => _neweditcompletetypesState();
}

class _neweditcompletetypesState extends State<neweditcompletetypes> {
   GlobalKey<FormState>formkey1=GlobalKey<FormState>();
   GlobalKey<FormState>formkey2=GlobalKey<FormState>();
 GlobalKey<FormState>formkey3=GlobalKey<FormState>();
 List materialsname=[];

  bool choice=true;
  intialize()async{
        await Provider.of<completetypesprovider>(context,listen: false).typesnamesdata();
        Provider.of<completetypesprovider>(context,listen: false).resetdate();
        Provider.of<completetypesprovider>(context,listen: false).resetmaterialname();
        Provider.of<completetypesprovider>(context,listen: false).addtypename.clear();
        Provider.of<completetypesprovider>(context,listen: false).addtypes.clear();
        Provider.of<completetypesprovider>(context,listen: false).edittypes.clear();

  }
@override
  void initState() {
    Future.delayed(Duration.zero,(){    intialize();
});
  }
  @override
  Widget build(BuildContext context) {
   return 
   Provider.of<completetypesprovider>(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator()))
   :Column
   (
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Radio(
              fillColor: MaterialStatePropertyAll(Colors.purple),
              value: true, groupValue: choice, onChanged: (value){
           choice=value!;
           setState(() {
             
           });
        
            }),
            Text("add category".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily),),
            SizedBox(width: 5,),
               Radio(
                              fillColor: MaterialStatePropertyAll(Colors.purple),

                value: false, groupValue: choice, onChanged: (value){
         choice=value!;
           setState(() {
             
           });
        
            }),
         
                        Text("edit old category".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily)),

          ],
        ),
      )
   , choice==true?Expanded(child: neweditaddcompletetypes()):Expanded(child: SingleChildScrollView(
     child: newediteditcompletetypes()
   ))]);
  
}}