import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/settings/machinesreports.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/widgets/machinesdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';
import '../../widgets/textform.dart';

class addmachines extends StatelessWidget{
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<machinesprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("add machines".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),),backgroundColor: appcolors.kprimarycolor,),
      body: SafeArea(child: 
      
       SingleChildScrollView(
         child: Form(
          key: formkey,
           child: Column(
              children: [
             SizedBox(height: 20,),
              dropdownbutton(hint: "choose departement".tr(),mo:Provider.of<machinesprovider>(context).departements,onchanged: (val){
                Provider.of<machinesprovider>(context,listen: false).changedropdepartement(val);
              },name: Provider.of<machinesprovider>(context).departementname,),
             
             
              textform(con: prov.machinename, valid:"mac error".tr()
               , hinttext: "machine".tr(), suffix:"",keyboardType: TextInputType.multiline),
              
             
              addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
               if( Provider.of<machinesprovider>(context,listen: false).checkdepartement(context)!=false);
               
               else if (formkey.currentState!.validate()){
                                   showDialog(context: context, builder:((context) {
                  return machinesdialog();
                }));                    
                  
               }}),
               SizedBox(height: 50,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(height: 2,width: double.infinity,color: Colors.black,),
               ),
                                SizedBox(height: 50,),
         
               addbutton(type: "show injection machines".tr(),height: 50, width: double.infinity, onpressed: ()async{
                await prov.getinjectionmachines();
                
         Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
           return machinesreports(data:prov.injectionmachines,departementname:"injection-departement",appBar: "injection-departement",);
         })));
               }, fontsize: 25, padding: 10),
               SizedBox(height: 10,),
               addbutton(type: "show blow machines".tr(),height: 50, width: double.infinity, onpressed: ()async{
                await prov.getblowingmachines();
                
         Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
           return machinesreports(data:prov.blowingmachines,departementname:"blow-departement",appBar: "blow-departement",);
         })));
               }, fontsize: 25, padding: 10),
               SizedBox(height: 500,)
               
                
              ],
            ),
         ),
       ),
      )
    );
  }
}