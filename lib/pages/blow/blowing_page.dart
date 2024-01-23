import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/blow/showblowreport.dart';
import 'package:fac_app/pages/blow/write-blowreport.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/categoriesbuttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/blowprovider.dart';
import '../../providers/injectionprovider.dart';
import '../../providers/showblowprovider.dart';
import '../../widgets/gradient.dart';

class blowing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<blowprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("blow-departement".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
       body:gradients( 
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsblowname[0],height: 60,onPressed: ()async{
            await              Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "blow-departement");

             Provider.of<machinesprovider>(context,listen: false).getblowingmachines();
             Provider.of<blowprovider>(context,listen: false).resetdatamachine();
            Provider.of<blowprovider>(context,listen: false).resetdatashift();
           Provider.of<blowprovider>(context,listen: false) .resetdate();        
           prov.cycle_time.clear();
           prov.mold.clear();
           prov.production_quantity.clear();
           prov.scrapquantity.clear();
           prov.stopreasons.clear();
           prov.worker.clear();
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return blowreport();
            })));
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsblowname[1],height: 60,onPressed: ()async{
                        await              Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "blow-departement");

              Provider.of<showblowprovider>(context,listen: false).resetdatashift();
              Provider.of<showblowprovider>(context,listen: false).resetreportsdata();
             Provider.of<showblowprovider>(context,listen: false) .resetdate(); 
               Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return showblowreport();
          })));
          },),
         
             ],
           ),
       ) 
    );
  }

}