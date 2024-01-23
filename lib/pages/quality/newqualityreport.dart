import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dialogquality.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newqualityreport extends StatefulWidget{
  @override
  State<newqualityreport> createState() => _newqualityrportState();
}

class _newqualityrportState extends State<newqualityreport> {
  var time=DateTime.now();

  intialize()async{
    await     Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "quality-departement");
            Provider.of<qualityprovider>(context,listen: false).resetdatashift();
           Provider.of<qualityprovider>(context,listen: false) .resetdate();        
           Provider.of<qualityprovider>(context,listen: false).product.clear();
           Provider.of<qualityprovider>(context,listen: false).defaul.clear();
           Provider.of<qualityprovider>(context,listen: false).machinename.clear();
           Provider.of<qualityprovider>(context,listen: false).notes.clear();
           
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    intialize();
  }
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<qualityprovider>(context);
    return Provider.of<qualityprovider>(context).date==""?CircleAvatar(backgroundColor: Colors.white,child: Center(child: CircularProgressIndicator())):
      
       SingleChildScrollView(
         child: Form(
          key: formkey,
           child: Column(
              children: [
             datebutton(onpressed: (){
                Provider.of<qualityprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<qualityprovider>(context).date,),
               
                dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<qualityprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<qualityprovider>(context).shift,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                                            Text("check time".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                     Text(" : "),

                     Text(time.hour>12?" (${(time.hour-12).abs()}:${time.minute.abs()}) ":"(${(time.hour-12).abs()}:${time.minute})",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                           Text(time.hour>12?"pm".tr():"am".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),

                    ],
                  ),
                textform(con: prov.machinename, valid:"mac error".tr(), hinttext: "machine".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                
                
                textform(con: prov.product, valid: "product error".tr()
                , hinttext: "product name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                textform(con: prov.defaul, valid: "defect error".tr()
                , hinttext: "defect name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
                 Padding(
                                     padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                     child: TextFormField(
                controller: prov.notes,
                maxLines: 5,
                decoration: InputDecoration(
                
            prefixStyle: TextStyle(),
            labelStyle: TextStyle(fontSize:25,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "notes".tr(),
           
         
            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            contentPadding: EdgeInsets.only(left:10,right: 10,top: 10)
                 )),
                                   ),
         
               Padding(
                 padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                 
                 ),
               
                       addbutton(type: "save".tr(),fontsize: 25,padding: 10,height: 50,onpressed: (){
                 if( Provider.of<qualityprovider>(context,listen: false).checkdate(context)!=false);
                 else if( Provider.of<qualityprovider>(context,listen: false).checkshift(context)!=false);
                 else if (formkey.currentState!.validate()==false){
                                                         
           
                  }
                  else{
                  showDialog(context: context, builder:((context) {
                    return showqualitydialog();
                  }));
                }
           },)
              ],
            ),
         ),
       );
  }

  
}