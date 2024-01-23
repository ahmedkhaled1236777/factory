import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/providers/machinesprovider.dart';
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

class injectionreport extends StatefulWidget{
  @override
  State<injectionreport> createState() => _injectionreportState();
}

class _injectionreportState extends State<injectionreport> {
  intialize()async{
     await    Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "injection-departement");
            Provider.of<machinesprovider>(context,listen: false).getinjectionmachines();
            Provider.of<injectionprovider>(context,listen: false).resetdatamachine();
            Provider.of<injectionprovider>(context,listen: false).resetdatashift();
           Provider.of<injectionprovider>(context,listen: false) .resetdate();         
           Provider.of<injectionprovider>(context,listen: false).cycle_time.clear();
           Provider.of<injectionprovider>(context,listen: false).mold.clear();
          Provider.of<injectionprovider>(context,listen: false).production_quantity.clear();
          Provider.of<injectionprovider>(context,listen: false).scrapquantity.clear();
          Provider.of<injectionprovider>(context,listen: false).stopreasons.clear();
          Provider.of<injectionprovider>(context,listen: false).worker.clear();
           
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    intialize();
  }
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<injectionprovider>(context);
    return Provider.of<injectionprovider>(context).date==null?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator())):
      
       SingleChildScrollView(
         child: Form(
          key: formkey,
           child: Column(
              children: [
              datebutton(onpressed: (){
              Provider.of<injectionprovider>(context,listen: false).chagedate(context);
              },date: Provider.of<injectionprovider>(context).date!,),
              dropdownbutton(hint: "choose machine".tr(),mo:Provider.of<machinesprovider>(context).injectionmachine,onchanged: (val){
                Provider.of<injectionprovider>(context,listen: false).changedropmachine(val);
              },name: Provider.of<injectionprovider>(context).machinename,),
              dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                Provider.of<injectionprovider>(context,listen: false).changedropshift(val);
              },name: Provider.of<injectionprovider>(context).shift,),
             
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
               if( Provider.of<injectionprovider>(context,listen: false).checkdate(context)!=false);
               else if( Provider.of<injectionprovider>(context,listen: false).checkmachine(context)!=false);
               else if( Provider.of<injectionprovider>(context,listen: false).checkshift(context)!=false);
               else if (formkey.currentState!.validate()==false){
                                                       
                  
                }
                else{
                showDialog(context: context, builder:((context) {
                  return showinjectiondialog();
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