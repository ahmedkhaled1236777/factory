import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:fac_app/pages/login/newlogin/mypath.dart';
import 'package:fac_app/pages/login/subusersview.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/subuserdialog.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newaddsubuser extends StatefulWidget{
  @override
  State<newaddsubuser> createState() => _newaddsubuserState();
}

class _newaddsubuserState extends State<newaddsubuser> {
  User? user=FirebaseAuth.instance.currentUser;
        List<usermodel>subusers=[];
double elevation=10;
 var ic=Icons.visibility;

      bool obsecure=false;


  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        var prov=Provider.of<settingsprovider>(context);

    return Scaffold(
      body:  Form(
          key: formkey,
           child:           SingleChildScrollView
(
             child: Column(
                children: [
                   ClipPath(
          clipper: mypath(),
          child: Container(child: Padding(
            padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height*0.3)/4),
            child:                   Text("My Factory",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontFamily: 'great',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),),
      
          ),width: double.infinity,height: MediaQuery.of(context).size.height*0.28 ,color: appcolors.kprimarycolor,),)
        
               ,
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      dropdownbutton(hint:"choose job".tr(),mo:Provider.of<settingsprovider>(context).users,onchanged: (val){
                        Provider.of<settingsprovider>(context,listen: false).changedroprole(val);
                      },name: Provider.of<settingsprovider>(context).role,),
                        SizedBox(height: 15,),
                         Material(
                        
                        borderRadius: BorderRadius.circular(30),
                                      elevation: elevation,
                                      color: appcolors.backgroundColor,
                                       child: TextFormField(
                                        validator: (value) {
                                          if(value!.isEmpty||value==null)return"erroruser".tr();
                                        },
                                        controller: prov.user_name,
                                                           decoration: InputDecoration(
                                                              enabledBorder:  OutlineInputBorder(
                                                              borderSide: BorderSide(color: appcolors.amcolor),
                                                              borderRadius: BorderRadius.circular(30)
                                                            ), 
                                                             focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(color: appcolors.amcolor),
                                                                borderRadius: BorderRadius.circular(30)
                                                              ), 
                                                                 prefixIcon: Icon(Icons.person),
                                                                 fillColor: appcolors.backgroundColor,
                                                                 filled: true,
                                                               
                                                           hintText: "user name".tr(),
                                                           border:OutlineInputBorder(                                                    borderSide: BorderSide(color: appcolors.amcolor),
                                       borderRadius: BorderRadius.circular(30))
                                                           ),
                                                                 ),
                                     ),
                                     SizedBox(height: 10,),
                                        Material(
                        
                        borderRadius: BorderRadius.circular(30),
                                      elevation: elevation,
                                      color: appcolors.backgroundColor,
                                       child: TextFormField(
                                        validator: (value) {
                                          if(value!.isEmpty||value==null)return"email error".tr();
                                        },
                                        controller: prov.email,
                                                           decoration: InputDecoration(
                                                              enabledBorder:  OutlineInputBorder(
                                                              borderSide: BorderSide(color: appcolors.amcolor),
                                                              borderRadius: BorderRadius.circular(30)
                                                            ), 
                                                             focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(color: appcolors.amcolor),
                                                                borderRadius: BorderRadius.circular(30)
                                                              ), 
                                                                 prefixIcon: Icon(Icons.email),
                                                                 fillColor: appcolors.backgroundColor,
                                                                 filled: true,
                                                               
                                                           hintText: "email".tr(),
                                                           border:OutlineInputBorder(                                                    borderSide: BorderSide(color: appcolors.amcolor),
                                       borderRadius: BorderRadius.circular(30))
                                                           ),
                                                                 ),
                                     ),
                                     SizedBox(height: 10,),
                                      TextFormField(
                                          obscureText: obsecure,
                                                validator: (value) {
                                                  if(value!.isEmpty||value==null)return "errorpass".tr();
                                                },
                                                            controller: prov.password,
                                                            decoration: InputDecoration(
                                                            errorBorder:   OutlineInputBorder(
                                                                borderSide: BorderSide(color: appcolors.thirdcolor),
                                                                borderRadius: BorderRadius.circular(30)
                                                              ), 
                                                              enabledBorder:  OutlineInputBorder(
                                                                borderSide: BorderSide(color: appcolors.amcolor),
                                                                borderRadius: BorderRadius.circular(30)
                                                              ), 
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(color: appcolors.amcolor),
                                                                borderRadius: BorderRadius.circular(30)
                                                              ), 
                                                       suffixIcon: 
                                                       IconButton(onPressed: (){
                                                        ic==Icons.visibility?ic=Icons.visibility_off: ic=Icons.visibility;
                                                        obsecure==false?obsecure=true:obsecure=false;
                                                        setState(() {
                                                          
                                                        });
                              
                                                       }, icon:  Icon(ic,color: appcolors.amcolor,))
                                                      ,
                                        fillColor: appcolors.backgroundColor,
                                        filled: true,
                                                            hintText:"password".tr(),
                                                            border: OutlineInputBorder(    
                          borderSide: BorderSide(color: appcolors.amcolor),
                              borderRadius: BorderRadius.circular(30))
                                                            ),
                                        ),
                                        SizedBox(height: 35,),
                                      
                                  
                      addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: (){
                        if( Provider.of<settingsprovider>(context,listen: false).checkrole(context)!=false);
                       else if (formkey.currentState!.validate()){
                        showDialog(context: context, builder:((context) {
                          return subuserdialog();
                        }));
                      }
                      else{
                        elevation=0;
                        setState(() {
                          
                        });
                      }
                        },),
                                     
                     
                    ],
                  ),
                )
               
                  
                ],
              ),
           ),
         ),

    );
  }
}