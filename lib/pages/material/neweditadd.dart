import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/login/resetpassword.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/materialdialog.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class neweditadd extends StatelessWidget{
     GlobalKey<FormState>formkey1=GlobalKey<FormState>();
   GlobalKey<FormState>formkey2=GlobalKey<FormState>();
 GlobalKey<FormState>formkey3=GlobalKey<FormState>();
 List materialsname=[];
  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
       datebutton(onpressed: (){
                Provider.of<materialprovider>(context,listen: false).changedate(context);
                },date: Provider.of<materialprovider>(context).date),
                          

            Form(key: formkey1,child: textform(con: Provider.of<materialprovider>(context,listen: false).addmaterialname, valid: "material error".tr(), hinttext: "enter material".tr(), suffix: "", keyboardType: TextInputType.multiline)),
            Form(key: formkey2,child: textform(con: Provider.of<materialprovider>(context,listen: false).addmaterials, valid: "quantity error".tr(), hinttext: "material quatity".tr(), suffix: "bag".tr(), keyboardType: TextInputType.number)),
                addbutton(type: "add",fontsize: 25,padding: 10,width: 200,height: 50,onpressed: ()async{
                       materialsname=await Provider.of<materialprovider>(context,listen: false).materialsname;

                 if( Provider.of<materialprovider>(context,listen: false).checkdate(context)!=false);
                  else  if(formkey1.currentState!.validate()&&formkey2.currentState!.validate()){
                    if(materialsname.contains(Provider.of<materialprovider>(context,listen: false).addmaterialname.text))ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(("old material".tr()))));
                 else   showDialog(context: context, builder: ((context) {
                      return showmaterialdialog(status: "quantity",materialname: Provider.of<materialprovider>(context).addmaterialname.text,quantity: Provider.of<materialprovider>(context).addmaterials.text,);
                    }));
                   }
                }),
    ],
   );
  }
  
}