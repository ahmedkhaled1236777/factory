import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/models/attendance/attendancemodel.dart';
import 'package:fac_app/providers/attendance.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/services/attendance/attendanceservice.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addnewemployee extends StatelessWidget{
  TextEditingController name=TextEditingController();
  TextEditingController jop=TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar:  AppBar(
          centerTitle: true,
          title: Text("اضافة موظف جديد".tr
          (),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,),
    body: SingleChildScrollView(
      child: Form(
        key:formkey ,
        child: Column(
          children: [
             datebutton(onpressed: (){
                  Provider.of<attendanceprovider>(context,listen: false).chagedate(context);
                  },date: Provider.of<attendanceprovider>(context).date,),
                   dropdownbutton(hint: "choose departement".tr(),mo:Provider.of<attendanceprovider>(context).departements,onchanged: (val){
                  Provider.of<attendanceprovider>(context,listen: false).changedropdepartement(val);
                },name: Provider.of<attendanceprovider>(context).departementname,),
                textform(con: name, valid: "برجاء ادخال اسم الموظف", hinttext: "اسم الموظف", suffix: "", keyboardType: TextInputType.text)
               , textform(con: jop, valid: "برجاء ادخال الوظيفه", hinttext: "الوظيفه", suffix: "", keyboardType: TextInputType.text)
        , SizedBox(height: 20,),
        addbutton(type: "add", height: 50, onpressed: ()async{
         if( Provider.of<attendanceprovider>(context,listen: false).checkdate(context,"date of hiring")!=false);
                   else if( Provider.of<attendanceprovider>(context,listen: false).departementname==null){
                    return AlertDialog(
        title:Center(child: Text("please choose date".tr())),
        
        actions: [
          Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
        ],
            );
                   }
                   else if (formkey.currentState!.validate()){
                                        try{                   
             await attendanceservice.setdata(attendancemodel(employeename: name.text, 
        departement:  Provider.of<attendanceprovider>(context,listen: false).departementname!,
         Dateofhiring: Provider.of<attendanceprovider>(context,listen: false).date, job: jop.text));
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("good job".tr())));
                    }catch(e){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("fail job".tr())));

                    }
                    
                    }
      
        }, fontsize: 20, padding: 30)
          ],
        ),
      ),
    ),
   );
  }
  
}