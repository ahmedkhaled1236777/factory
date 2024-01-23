import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/settings/machines.dart';
import 'package:fac_app/pages/settings/shifts.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providercategories.dart';
import '../../providers/settingsprovider.dart';
import '../../widgets/categoriesbuttons.dart';
import '../../widgets/gradient.dart';
import '../login/addsubuser.dart';

class settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<settingsprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("settings".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
       body:gradients(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsettings[0],height: 60,onPressed: (){
       
          
            Provider.of<shiftsprovider>(context,listen: false).resetdepartementname();
            Provider.of<shiftsprovider>(context,listen: false).shiftname.clear();
             
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addshifts();
          })));
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsettings[1],height: 60,onPressed: (){
            Provider.of<machinesprovider>(context,listen: false).resetdepartementname();
        Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addmachines();
          })));
          
           
          },),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsettings[2],height: 60,onPressed: (){
       
                  Provider.of<settingsprovider>(context,listen: false).resetdroprole();
           Provider.of<settingsprovider>(context,listen: false) .restemailandpassword();      
             
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addsubuser();
          })));
          },),
          
          SizedBox(height: 10,),
          
             ],
           ),
       )
    );
  }

}