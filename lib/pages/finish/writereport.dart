import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/finishprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/finishdialog.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newfinishreport extends StatefulWidget{
  @override
  State<newfinishreport> createState() => newfinishreportstate();
}

class newfinishreportstate extends State<newfinishreport> {
  intialize()async{
     await Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "finish-departement");

            Provider.of<finishprovider>(context,listen: false).resetdatashift();
           Provider.of<finishprovider>(context,listen: false) .resetdate();      
             Provider.of<finishprovider>(context,listen: false).production_quantity.clear();
             Provider.of<finishprovider>(context,listen: false).engineer.clear();
             Provider.of<finishprovider>(context,listen: false).jop.clear();
             Provider.of<finishprovider>(context,listen: false).worker.clear();   
           
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    intialize();
  }
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<finishprovider>(context);
    return Provider.of<finishprovider>(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator())):
      
       SingleChildScrollView(
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
              ],
            ),
         ),
       );
  }

  
}