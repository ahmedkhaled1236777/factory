import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/finishprovider.dart';
import 'package:fac_app/providers/injectionprovider.dart';
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
import '../../widgets/finishdialog.dart';
import '../../widgets/gradient.dart';

class finishreport extends StatelessWidget{
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<finishprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("write finish reports".tr(),style: TextStyle(fontSize: 20),)),
      body: SafeArea(child: 
      
       SingleChildScrollView(
         child: gradients(
           child: Form(
            key: formkey,
             child: Column(
                children: [
                datebutton(onpressed: (){
                Provider.of<finishprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<finishprovider>(context).date,),
               
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<finishprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<finishprovider>(context).shift,),
                textform(con: prov.worker, valid:"worker error".tr()
                 , hinttext: "worker-name".tr(), suffix:"",keyboardType: TextInputType.multiline),
                
                textform(con: prov.jop, valid: "his job".tr()
                , hinttext: "job".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                
                textform(con: prov.production_quantity, valid:"production error".tr()
                , hinttext: "production qyantity".tr(), suffix:"piece".tr(),keyboardType: TextInputType.number,),
               
                addbutton(type: "save".tr(),fontsize: 25,padding: 15,height: 50,onpressed: (){
                 if( Provider.of<finishprovider>(context,listen: false).checkdate(context)!=false);
                 else if( Provider.of<finishprovider>(context,listen: false).checkshift(context)!=false);
                 else if (formkey.currentState!.validate()==false){
                                                         
         
                  }
                  else{
                  showDialog(context: context, builder:((context) {
                    return showfinishdialog();
                  }));
                }
         },)
                ,SizedBox(height: 300,)
                  
                ],
              ),
           ),
         ),
       ),
      )
    );
  }
}