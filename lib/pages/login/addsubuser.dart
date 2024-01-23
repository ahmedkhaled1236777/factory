import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:fac_app/pages/login/subusersview.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:fac_app/widgets/subuserdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/finishprovider.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';
import '../../widgets/textform.dart';

class addsubuser extends StatefulWidget{
  @override
  State<addsubuser> createState() => _addsubuserState();
}

class _addsubuserState extends State<addsubuser> {

  User? user=FirebaseAuth.instance.currentUser;
        List<usermodel>subusers=[];


  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<settingsprovider>(context);
    return Scaffold(
      appBar: AppBar(title:Text("add users".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: apptexts.appfonfamily),),backgroundColor: appcolors.kprimarycolor,),
      body: SafeArea(child: 
      
       Form(
        key: formkey,
         child:           SingleChildScrollView
       (
           child: Column(
              children: [
             SizedBox(height: 20
             ,),
             
              dropdownbutton(hint:"choose job".tr(),mo:Provider.of<settingsprovider>(context).users,onchanged: (val){
                Provider.of<settingsprovider>(context,listen: false).changedroprole(val);
              },name: Provider.of<settingsprovider>(context).role,),
              textform(con: prov.user_name, valid:"erroruser".tr(), hinttext: "user name".tr(), suffix:"",keyboardType: TextInputType.multiline,),
              textform(con: prov.email, valid:"email error".tr(), hinttext: "email".tr(), suffix:"",keyboardType: TextInputType.multiline,),
              textform(con: prov.password, valid:"errorpass".tr()
               , hinttext: "password".tr(), suffix:"",keyboardType: TextInputType.multiline),
             
              addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
                if( Provider.of<settingsprovider>(context,listen: false).checkrole(context)!=false);
               else if (formkey.currentState!.validate()){
                showDialog(context: context, builder:((context) {
                  return subuserdialog();
                }));
              }
                },),
             
              addbutton(type: "show users",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: ()async{
                subusers.removeRange(0, subusers.length);
                subusers=await user_service.getsubusers(cashhelper.getstringdata("factory_id"), cashhelper.getstringdata("email"));
       Navigator.push(context, MaterialPageRoute(builder: ((context) {
         return subusersview(subusers: subusers);
       })))      ;            },),
       SizedBox(height: 300,)
             
                
              ],
            ),
         ),
       ),
      )
    );
  }
}