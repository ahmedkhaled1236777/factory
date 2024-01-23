import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/material/neweditadd.dart';
import 'package:fac_app/pages/material/neweditedit.dart';
import 'package:fac_app/pages/types/neweditaddtypes.dart';
import 'package:fac_app/pages/types/neweditedittypes.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/addeditdialog.dart';
import 'package:fac_app/widgets/containertypes.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/materialdialog.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class newedittypes extends StatefulWidget{
  @override
  State<newedittypes> createState() => _neweditState();
}

class _neweditState extends State<newedittypes> {
   GlobalKey<FormState>formkey1=GlobalKey<FormState>();
   GlobalKey<FormState>formkey2=GlobalKey<FormState>();
 GlobalKey<FormState>formkey3=GlobalKey<FormState>();
 List materialsname=[];

  bool choice=true;
  intialize()async{
        await Provider.of<typesprovider>(context,listen: false).typesnamesdata();
        Provider.of<typesprovider>(context,listen: false).resetdate();
        Provider.of<typesprovider>(context,listen: false).resetmaterialname();
        Provider.of<typesprovider>(context,listen: false).addtypename.clear();
        Provider.of<typesprovider>(context,listen: false).addtypes.clear();
        Provider.of<typesprovider>(context,listen: false).edittypes.clear();

  }
@override
  void initState() {
    Future.delayed(Duration.zero,(){    intialize();
});
  }
  @override
  Widget build(BuildContext context) {
   return 
   Provider.of<typesprovider>(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator()))
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
   , choice==true?Expanded(child: neweditaddtypes()):Expanded(child: SingleChildScrollView(
     child: neweditedittypes()
   ))]);
  
}}