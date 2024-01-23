import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/quality/showqualityreport.dart';
import 'package:fac_app/pages/quality/writequalityreport.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providercategories.dart';
import '../../widgets/categoriesbuttons.dart';
import '../../widgets/gradient.dart';

class quality extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<qualityprovider>(context);
   return Scaffold(
    appBar: AppBar(title: Text("quality-departement".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
     body:gradients(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).qualitybutton[0],height: 60,onPressed: ()async{

       await     Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "quality-departement");
            Provider.of<qualityprovider>(context,listen: false).resetdatashift();
           Provider.of<qualityprovider>(context,listen: false) .resetdate();        
           prov.product.clear();
           prov.defaul.clear();
           prov.machinename.clear();
           prov.notes.clear();
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return writequalityreport();
            })));
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).qualitybutton[1],height: 60,onPressed: ()async{
                   await     Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "quality-departement");

 

              Provider.of<qualityprovider>(context,listen: false).resetdatashift();
             Provider.of<qualityprovider>(context,listen: false) .resetdate(); 
               Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return showqualityreport() ;
          })));
          }),
         
        ],
         ),
     )
   );
  }

}