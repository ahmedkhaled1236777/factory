import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/categoriesbuttons.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/injectiondialog.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/blowprovider.dart';
import '../../widgets/blowdialog.dart';
import '../../widgets/gradient.dart';

class blowreport extends StatelessWidget{
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<blowprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("write producrion reports".tr(),style: TextStyle(fontSize: 20),)),
      body: SafeArea(child: 
      
       SingleChildScrollView(
         child: gradients(
           child: Form(
            key: formkey,
             child: Column(
                children: [
                datebutton(onpressed: (){
                Provider.of<blowprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<blowprovider>(context).date!,),
                dropdownbutton(hint: "choose machine",mo:Provider.of<machinesprovider>(context).blowingmachine,onchanged: (val){
                  Provider.of<blowprovider>(context,listen: false).changedropmachine(val);
                },name: Provider.of<blowprovider>(context).machinename,),
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<blowprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<blowprovider>(context).shift,),
                textform(con: prov.worker, valid:"worker error".tr()
                 , hinttext: context.locale==Locale("en")?"Worker name":"اسم العامل", suffix:"",keyboardType: TextInputType.multiline),
                
                textform(con: prov.mold, valid: "mold error".tr()
                , hinttext: context.locale==Locale("en")?"Mold name":"اسم الاسطميه" ,suffix:"",keyboardType: TextInputType.multiline,),
                textform(con: prov.cycle_time, valid:"cycle error".tr()
                , hinttext: context.locale==Locale("en")?"Cycle time":" زمن الدوره", suffix:context.locale==Locale("en")?"sec":"ثانيه",keyboardType: TextInputType.number,),
                textform(con: prov.production_quantity, valid:"production error".tr()
                , hinttext:context.locale==Locale("en")?"Production quantity":"كمية الانتاج",suffix: context.locale==Locale("en")?"piece":"قطعه",keyboardType: TextInputType.number,),
                textform(con: prov.scrapquantity, valid:"scrap error".tr(), hinttext: context.locale==Locale("en")?"Scrap quantity":"كمية الهالك", suffix:context.locale==Locale("en")?"piece":"قطعه",keyboardType: TextInputType.number,),
                textform(con: prov.stopreasons, valid:"machine error".tr(), hinttext: context.locale==Locale("en")?"Machine malfunctions":"اعطال الماكينه", suffix:"",keyboardType: TextInputType.multiline,),
                addbutton(type: "save",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
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
         },),SizedBox(height: 400,)
                
                  
                ],
              ),
           ),
         ),
       ),
      )
    );
  }
}