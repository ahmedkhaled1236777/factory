import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/maintenancedialog.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newmachinereport extends StatefulWidget{
  @override
  State<newmachinereport> createState() => newmachinereportstate();
}

class newmachinereportstate extends State<newmachinereport> {
  intialize()async{
        await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();      
        Provider.of<maintenceprovider>(context,listen: false) .machinename.clear();
        Provider.of<maintenceprovider>(context,listen: false) .stopreasons.clear();
        Provider.of<maintenceprovider>(context,listen: false) .stopreasonstime.clear();
        Provider.of<maintenceprovider>(context,listen: false) .notes.clear();
           
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    intialize();
  }
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<maintenceprovider>(context);
    return Provider.of<maintenceprovider
    >(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator())):
      
       SingleChildScrollView(
         child: Form(
          key: formkey,
           child: Column(
              children: [
              datebutton(onpressed: (){
                Provider.of<maintenceprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<maintenceprovider>(context).date,),
              
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<maintenceprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<maintenceprovider>(context).shift,),
                                textform(con: prov.machinename, valid:"mac error".tr(), hinttext: "machine".tr(),suffix:"",keyboardType: TextInputType.multiline,),

               Padding(
                 padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                 child: TextFormField(
                  controller: prov.stopreasons,
                  validator: (value) {
                    if(value!.isEmpty)return "default error".tr();
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left:10,right: 10,top: 10),

            prefixStyle: TextStyle(),
            labelStyle: TextStyle(fontSize:25,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "failure mareason".tr(),
         
            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                 ),
                  
                 ),
               ),
                             textform(con: prov.stopreasonstime, valid:"fix error".tr(), hinttext: "fix time".tr(), suffix:"minute".tr(),keyboardType: TextInputType.multiline,),
                                   Padding(
                                     padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                     child: TextFormField(
                controller: prov.notes,
                maxLines: 5,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left:10,right: 10,top: 10),

            prefixStyle: TextStyle(),
            labelStyle: TextStyle(fontSize:25,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "notes".tr(),
           
         
            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                 )),
                                   ),
         
                
               
                addbutton(type: "save",fontsize: 25,padding: 10,height: 50,onpressed: (){
                 if( Provider.of<maintenceprovider>(context,listen: false).checkdate(context)!=false);
                 else if( Provider.of<maintenceprovider>(context,listen: false).checkmachine(context)!=false);
                 else if( Provider.of<maintenceprovider>(context,listen: false).checkshift(context)!=false);
                 else if (formkey.currentState!.validate()==false){
                                                         
         
                  }
                  else{
                  showDialog(context: context, builder:((context) {
                    return showmainteancedialog();
                  }));
                }
         },),
              ],
            ),
         ),
       );
  }

  
}