import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/blowprovider.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/widgets/blowdialog.dart';
import 'package:fac_app/widgets/categoriesbuttons.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/injectiondialog.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/shiftsprovider.dart';
import '../../widgets/gradient.dart';

class newblowrport extends StatefulWidget{
  @override
  State<newblowrport> createState() => _newblowrportState();
}

class _newblowrportState extends State<newblowrport> {
  intialize()async{
     await    Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "blow-departement");
            Provider.of<machinesprovider>(context,listen: false).getblowingmachines();
            Provider.of<blowprovider>(context,listen: false).resetdatamachine();
            Provider.of<blowprovider>(context,listen: false).resetdatashift();
           Provider.of<blowprovider>(context,listen: false) .resetdate();         
           Provider.of<blowprovider>(context,listen: false).cycle_time.clear();
           Provider.of<blowprovider>(context,listen: false).mold.clear();
          Provider.of<blowprovider>(context,listen: false).production_quantity.clear();
          Provider.of<blowprovider>(context,listen: false).scrapquantity.clear();
          Provider.of<blowprovider>(context,listen: false).stopreasons.clear();
          Provider.of<blowprovider>(context,listen: false).worker.clear();
           
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    intialize();
  }
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<blowprovider>(context);
    return Provider.of<blowprovider>(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator())):
      
       SingleChildScrollView(
         child: Form(
          key: formkey,
           child: Column(
              children: [
              datebutton(onpressed: (){
              Provider.of<blowprovider>(context,listen: false).chagedate(context);
              },date: Provider.of<blowprovider>(context).date!,),
              dropdownbutton(hint: "choose machine".tr(),mo:Provider.of<machinesprovider>(context).blowingmachine,onchanged: (val){
                Provider.of<blowprovider>(context,listen: false).changedropmachine(val);
              },name: Provider.of<blowprovider>(context).machinename,),
              dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                Provider.of<blowprovider>(context,listen: false).changedropshift(val);
              },name: Provider.of<blowprovider>(context).shift,),
             
              textform(con: prov.worker, valid:"worker error".tr()
               , hinttext: "worker name".tr(), suffix:"",keyboardType: TextInputType.multiline),
              
              textform(con: prov.mold, valid: "mold error".tr()
              , hinttext: "mold name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
              textform(con: prov.cycle_time, valid:"cycle error".tr()
              , hinttext: "cycle time".tr(), suffix:"sec".tr(),keyboardType: TextInputType.number,),
              textform(con: prov.production_quantity, valid:"production error".tr()
              , hinttext: "production qyantity".tr(), suffix:"piece".tr(),keyboardType: TextInputType.number,),
              textform(con: prov.scrapquantity, valid:"scrap error".tr(), hinttext: "scrap qyantity".tr(), suffix:"piece".tr(),keyboardType: TextInputType.number,),
              textform(con: prov.stopreasons, valid:"machine error".tr(), hinttext: "machine malfunctions".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                            SizedBox(height: 7,),

              addbutton(type: "save".tr(),fontsize: 25,padding: 15,height: 50,onpressed: (){
               if( Provider.of<blowprovider>(context,listen: false).checkdate(context)!=false);
               else if( Provider.of<blowprovider>(context,listen: false).checkmachine(context)!=false);
               else if( Provider.of<blowprovider>(context,listen: false).checkshift(context)!=false);
               else if (formkey.currentState!.validate()==false){
                                                       
                  
                }
                else{
                showDialog(context: context, builder:((context) {
                  return showblowdialog();
                }));
              }
                  },),
                  SizedBox(height: 10,)
              ],
            ),
         ),
       );
  }

  
}