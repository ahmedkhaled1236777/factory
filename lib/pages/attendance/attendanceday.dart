import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/providers/attendance.dart';
import 'package:fac_app/services/attendance/attendanceservice.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class attendanceday extends StatefulWidget{
  @override
  State<attendanceday> createState() => _attendancedayState();
}

class _attendancedayState extends State<attendanceday> {


  @override
  void initState() {
   
   
    }
    Map absence={};
  @override
  Widget build(BuildContext context) {

   return Scaffold(
 appBar: AppBar(
          centerTitle: true,
          title: Text("attendance-departement".tr
          (),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,),
         body: Column(
           children:[
             datebutton(onpressed: (){
                Provider.of<attendanceprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<attendanceprovider>(context).date,),
                 dropdownbutton(hint: "choose departement".tr(),mo:Provider.of<attendanceprovider>(context).departements,onchanged: (val) async {
                Provider.of<attendanceprovider>(context,listen: false).changedropdepartement(val);
                Provider.of<attendanceprovider>(context,listen: false).namesofdepartement();
               
               
              },name: Provider.of<attendanceprovider>(context).departementname,),
 Provider.of<attendanceprovider>(context).status.isEmpty?Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),):            Expanded(
             child: ListView.separated(itemBuilder: (context,i)=>SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  children: [
                    SizedBox(width: 5,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.23,
                      child: Text(
                         Provider.of<attendanceprovider>(context).names[i],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("حضور"),
                    Radio(value: "حضور", groupValue:     Provider.of<attendanceprovider>(context).status[i], onChanged: (value){
                      Provider.of<attendanceprovider>(context,listen: false).changestatus(i,value!);
                                                       absence.remove(Provider.of<attendanceprovider>(context,listen: false).names[i]);

                    },activeColor: appcolors.kprimarycolor,overlayColor: MaterialStatePropertyAll(appcolors.amcolor)),
                    SizedBox(width: 15,),
                                    Text("اجازه"),
                 
                    Radio(value: "اجازه", groupValue:                          Provider.of<attendanceprovider>(context).status[i], onChanged: (value){

                                           Provider.of<attendanceprovider>(context,listen: false).changestatus(i,value!);
                         absence.remove(Provider.of<attendanceprovider>(context,listen: false).names[i]);

                             absence.addAll({ Provider.of<attendanceprovider>(context,listen: false).names[i]:Provider.of<attendanceprovider>(context,listen: false).status[i]})    ;          

                    },activeColor: appcolors.kprimarycolor,overlayColor: MaterialStatePropertyAll(appcolors.amcolor)),
                                    SizedBox(width: 15,),
                 
                                    Text("غياب"),
                 
                    Radio(value: "غياب", groupValue:  Provider.of<attendanceprovider>(context).status[i], onChanged: (value){
                                           Provider.of<attendanceprovider>(context,listen: false).changestatus(i,value!);
                                 absence.remove(Provider.of<attendanceprovider>(context,listen: false).names[i]);
                             absence.addAll({ Provider.of<attendanceprovider>(context,listen: false).names[i]:Provider.of<attendanceprovider>(context,listen: false).status[i]})    ;          
                    },activeColor: appcolors.kprimarycolor,overlayColor: MaterialStatePropertyAll(appcolors.amcolor),)
                  ],
                 ),
               ),
             ), separatorBuilder: (context,i)=>SizedBox(height: 5,), itemCount:  Provider.of<attendanceprovider>(context).names.length),
           ),
   Provider.of<attendanceprovider>(context).  status.isEmpty?SizedBox():      addbutton(type: "تاكيد", height: 50, onpressed: ()async{
    
    await attendanceservice.svaeallabsence(absence, Provider.of<attendanceprovider>(context,listen: false).departementname!, "${Provider.of<attendanceprovider>(context,listen: false).date.replaceAll("/", "&")}");
           }, fontsize: 20, padding: 15)
       ]  ),
         
   );
  }
}