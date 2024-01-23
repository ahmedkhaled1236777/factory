import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/material/addmaterial.dart';
import 'package:fac_app/pages/material/showedits.dart';
import 'package:fac_app/pages/material/showmaterial.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/providercategories.dart';
import '../../widgets/categoriesbuttons.dart';
import '../../widgets/gradient.dart';

class material extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
   return Scaffold(
    appBar: AppBar(title: Text("material-departement".tr(),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),),),
    body:gradients(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsmaterialname[0],height: 60,onPressed:()async{

          await prov.reportsdata();
       showSearch(context: context, delegate: showmaterialsearch());
   
           } ,),
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsmaterialname[1],height: 60,onPressed:()async{
                   Provider.of<materialprovider>(context,listen: false).resetmaterialname();
                   Provider.of<materialprovider>(context,listen: false).addmaterialname.clear();
                   Provider.of<materialprovider>(context,listen: false).addmaterials.clear();
                   Provider.of<materialprovider>(context,listen: false).editmaterials.clear();

           
          await prov.materialnamesdata();
                        Provider.of<materialprovider>(context,listen: false).resetdate();

             Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return addmaterial();
    })));  
                    
    
          },),
         
          SizedBox(height: 10,),
          categoriebutton(buttontext:Provider.of<categoriesprovider>(context).buttonsmaterialname[2],height: 60,onPressed:(){

                                    Provider.of<materialprovider>(context,listen: false).resetdate();

            
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                      return showedits();
                    })));
    
          },),
         
        ],
      ),
    )
   );
  }

}