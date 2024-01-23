import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/maintenance/maintenancemoldreport.dart';
import 'package:fac_app/pages/maintenance/maintenancereport.dart';
import 'package:fac_app/pages/maintenance/writemachine-maintenance.dart';
import 'package:fac_app/pages/maintenance/writemold-maintenance.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providercategories.dart';
import '../../providers/shiftsprovider.dart';
import '../../widgets/categoriesbuttons.dart';
import '../../widgets/gradient.dart';

class maintenance extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     var prov=Provider.of<maintenceprovider>(context);

   return Scaffold(
    appBar: AppBar(title: Text("maintenance-departement".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: apptexts.appfonfamily),),),
     body:gradients(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).maintenancebutton[0],height: 60,onPressed: ()async{
                      await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();      
        prov.machinename.clear();
        prov.stopreasons.clear();
        prov.stopreasonstime.clear();
        prov.notes.clear();
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return machinemaintenancereport();
          })));
     
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).maintenancebutton[1],height: 60,onPressed: ()async{
                                  await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

                    Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();      
prov.machinename.clear();        prov.stopreasons.clear();
        prov.stopreasonstime.clear();
        prov.notes.clear();
        prov.mold.clear();
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return moldmaintenancereport();
          })));
          }),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).maintenancebutton[2],height: 60,onPressed: ()async{
     await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();    
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return showmaintenancereport();
          })));
          }),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).maintenancebutton[3],height: 60,onPressed: ()async{
                                  await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();    
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return showmoldmaintenancereport();
          })));
          }),
         
        ],
         ),
     )
     
   );
  }

}