
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/widgets/containereditsmaterial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/gradient.dart';

class editreports extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<materialprovider>(context);
   return Scaffold(
     appBar: AppBar(title: Text("reports".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body:    gradients(
        child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Card(
                  child:prov.editreports .isEmpty?Container(width: double.infinity,child: Center(child: Text("search error".tr()),),) : containeredits(data: Provider.of<materialprovider>(context).editreports),
                      
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.blue)),
                    ),
                  ),
      )

   );
  }

}