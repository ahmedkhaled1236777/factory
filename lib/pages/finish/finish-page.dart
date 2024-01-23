import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/finish/showfinishreport.dart';
import 'package:fac_app/pages/finish/write-finishreport.dart';
import 'package:fac_app/providers/finishprovider.dart';
import 'package:fac_app/providers/languageprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/injectionprovider.dart';
import '../../providers/showfinishprovider.dart';
import '../../widgets/categoriesbuttons.dart';
import '../../widgets/gradient.dart';

class finish extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<finishprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("finish-departement".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
       body:gradients(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsfinishname[0],height: 60,onPressed: ()async{
       
          await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "finish-departement");

            Provider.of<finishprovider>(context,listen: false).resetdatashift();
           Provider.of<finishprovider>(context,listen: false) .resetdate();      
             prov.production_quantity.clear();
             prov.engineer.clear();
             prov.jop.clear();
             prov.worker.clear();   
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return finishreport();
          })));
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsfinishname[1],height: 60,onPressed: ()async{
                              await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "finish-departement");

       
       
             Provider.of<showfinishprovider>(context,listen: false).resetdatashift();
             Provider.of<showfinishprovider>(context,listen: false).resetreportsdata();
             Provider.of<showfinishprovider>(context,listen: false) .resetdate(); 
               Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return showfinishreport();
          })));
          },),
         
             ],
           ),
       )
    );
  }

}