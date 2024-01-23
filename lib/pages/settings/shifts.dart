import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/services/shifts/shitsservices.dart';
import 'package:fac_app/widgets/shiftdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/machinesprovider.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/machinesdialog.dart';
import '../../widgets/removeoradd.dart';
import '../../widgets/textform.dart';

class addshifts extends StatefulWidget{
  @override
  State<addshifts> createState() => _addshiftsState();
}

class _addshiftsState extends State<addshifts> {
                  List shifts=[];

  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<shiftsprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("add shifts".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: apptexts.appfonfamily),),backgroundColor: appcolors.kprimarycolor,),
      body: SafeArea(child: 
      
       Form(
        key: formkey,
         child: Column(
            children: [
           SizedBox(height: 20,),
            dropdownbutton(hint: "choose departement".tr(),mo:Provider.of<shiftsprovider>(context).departements,onchanged: (val){
              Provider.of<shiftsprovider>(context,listen: false).changedropdepartement(val);
            },name: Provider.of<shiftsprovider>(context).departementname,),
           
           
            textform(con: prov.shiftname, valid:"shift error".tr()
             , hinttext: "shift name".tr(), suffix:"",keyboardType: TextInputType.multiline),
            
           
            addbutton(type: "add".tr(),fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
             if( Provider.of<shiftsprovider>(context,listen: false).checkdepartement(context)!=false);
             
             else if (formkey.currentState!.validate()){
                                 showDialog(context: context, builder:((context) {
                return shiftdialog();
              }));                    
              
             }}),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container(height: 2,width: double.infinity,color: Colors.black,),
             ),
                              SizedBox(height: 20,),
                               addbutton(type: "show shifts".tr(),fontsize: 25,padding: 10,width: 200,height: 50,onpressed: () async {
             if( Provider.of<shiftsprovider>(context,listen: false).checkdepartement(context)!=false);
             
             else {
              shifts.removeRange(0, shifts.length);
               await prov.getshifts(departementname: prov.departementname!);     
               shifts=prov.shift;    
             }}),
       
        shifts.isEmpty?   Expanded(child:Center(child: Text(""))): Expanded(
             child: ListView.separated(itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Card(
                      child: Row(
                        children: [
                        
                        Expanded(
                          child: IconButton(onPressed: (()async {
                           await shiftservice.deleteshift(shifts[index], prov.departementname!);
                           shifts.removeWhere((element) => element==shifts[index]);
                           setState(() {
                             
                           });
                          }), icon: Icon(Icons.delete)),
                        ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 5),
                                                    child: Text(shifts[index],textAlign: TextAlign.end,),
                                                  ),
                                                ),
       
                      ],),
                    ),
                  );
                }), separatorBuilder: ((context, index) {
                  return SizedBox(height: 5,);
                  
                }), itemCount: prov.shift.length),
           )          
                             
           
             
              
            ],
          ),
       ),
      )
    );
  }
}