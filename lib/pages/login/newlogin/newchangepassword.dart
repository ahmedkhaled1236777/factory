import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/login/newlogin/mypath.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class newchangepassword extends StatefulWidget{
  @override
  State<newchangepassword> createState() => _newchangepasswordState();
}

class _newchangepasswordState extends State<newchangepassword> {
   GlobalKey<FormState>formkey=GlobalKey<FormState>();

      TextEditingController currentpassword=TextEditingController();

      TextEditingController newpassword=TextEditingController();

      TextEditingController newpassword2=TextEditingController();

      double elevation=10;

      var ic=Icons.visibility;

      bool obsecure=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
            children: [
             ClipPath(
              clipper: mypath(),
              child: Container(child: Padding(
                padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height*0.3)/4),
                child:                   Text("My Factory",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontFamily: 'great',fontWeight: FontWeight.w600,color: appcolors.backgroundColor),),
          
              ),width: double.infinity,height: MediaQuery.of(context).size.height*0.28,color: appcolors.kprimarycolor,),)
            
            ,Expanded(child:   SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child:Column(children: [
                     Material(
                    borderRadius: BorderRadius.circular(30),
                                  elevation: elevation,
                                  color: appcolors.backgroundColor,
                                  child: TextFormField(
                                          validator: (value) {
                                            if(value!.isEmpty||value==null)return "oldpass".tr();
                                          },
                                                      controller: currentpassword,
                                                      obscureText: obsecure,
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
                                                 suffixIcon:  IconButton(onPressed: (){
                                                  ic==Icons.visibility?ic=Icons.visibility_off: ic=Icons.visibility;
                                                  obsecure==false?obsecure=true:obsecure=false;
                                                  setState(() {
                                                    
                                                  });
        
                                                 }, icon:  Icon(ic,color: appcolors.amcolor,)),
                                  fillColor: appcolors.backgroundColor,
                                  filled: true,
                                                      hintText: "coldpass".tr(),
                                                      border: OutlineInputBorder(    
                    borderSide: BorderSide(color: appcolors.amcolor),
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
                                    obscureText: obsecure,
                                          validator: (value) {
                                            if(value!.isEmpty||value==null)return "newpass".tr();
                                          },
                                                      controller: newpassword,
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
                                                 suffixIcon: IconButton(onPressed: (){
                                                  ic==Icons.visibility?ic=Icons.visibility_off: ic=Icons.visibility;
                                                  obsecure==false?obsecure=true:obsecure=false;
                                                  setState(() {
                                                    
                                                  });
        
                                                 }, icon:  Icon(ic,color: appcolors.amcolor,)),
                                  fillColor: appcolors.backgroundColor,
                                  filled: true,
                                                      hintText: "ccnewpass".tr(),
                                                      border: OutlineInputBorder(    
                    borderSide: BorderSide(color: appcolors.amcolor),
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
                                    obscureText: obsecure,
                                          validator: (value) {
                                            if(value!.isEmpty||value==null)return "cnewpass".tr();
                                          },
                                                      controller: newpassword2,
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
                                                      hintText: "cccnewpass".tr(),
                                                      border: OutlineInputBorder(    
                    borderSide: BorderSide(color: appcolors.amcolor),
        borderRadius: BorderRadius.circular(30))
                                                      ),
                                  ),
                                )
                          ,SizedBox(height: 35,),
                        
                        MaterialButton(onPressed: (()async{
        if(formkey.currentState!.validate()){
        User? user=await FirebaseAuth.instance.currentUser;
        if(user!=null){
        final cred=EmailAuthProvider.credential(email: user.email!, password: currentpassword.text);
        user.reauthenticateWithCredential(cred).then((value) {
        if(newpassword.text!=newpassword2.text)throw"كلمات السر الجديده مختلفه ";
        
          user.updatePassword(newpassword.text).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تمت تغيير كلمة السر")));
          Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
        
        }
        ).catchError((error) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(error.toString()))));
          });
        }).catchError((err) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(err.toString()))));
        
        });}
        
        }
        else {elevation=0;setState(() {
          
        });}
        }),
                         
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(30)
                        ,color: appcolors.kprimarycolor
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),width: double.infinity,child: Text("Change password".tr(),textAlign: TextAlign.center,style: TextStyle(fontFamily: "laila",color: Colors.white,fontSize: 20),)),),
                       
                         
                            SizedBox(height: 400,)
                ],)
              ),
            ),)
            ],
          ),
      ),
    );
  }
}