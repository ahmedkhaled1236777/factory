import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/main.dart';
import 'package:fac_app/pages/injection/showinjectionreports.dart';
import 'package:fac_app/pages/injection/write-report.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/categoriesbuttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/showinjectionreportprovider.dart';
import '../../widgets/gradient.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class injection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<injectionprovider>(context);
   return Scaffold(
    appBar: AppBar(title: Text("injection-departement".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    body:gradients(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsinjectionname[0],height: 60,onPressed:()async{
    
    
        await    Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "injection-departement");
            Provider.of<machinesprovider>(context,listen: false).getinjectionmachines();
            Provider.of<injectionprovider>(context,listen: false).resetdatamachine();
            Provider.of<injectionprovider>(context,listen: false).resetdatashift();
           Provider.of<injectionprovider>(context,listen: false) .resetdate();         
           prov.cycle_time.clear();
           prov.mold.clear();
          prov.production_quantity.clear();
          prov.scrapquantity.clear();
          prov.stopreasons.clear();
          prov.worker.clear();
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return injectionreport();
          })));} ,),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsinjectionname[1],height: 60,onPressed:()async{
                  await      Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "injection-departement");

                      Provider.of<showinjectionprovider>(context,listen: false).resetdatashift();
             Provider.of<showinjectionprovider>(context,listen: false) .resetdate(); 
             Provider.of<showinjectionprovider>(context,listen: false) .resetreportsdata(); 
             
    
          },),
         
        ],
      ),
    )
   );
  }

}