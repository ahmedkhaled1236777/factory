import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/containertypesedits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/gradient.dart';

class edittypesreports extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<typesprovider>(context);
   return Scaffold(
     appBar: AppBar(title: Text("reports".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body:    gradients(
        child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Card(
                  child:prov.editreports .isEmpty?Container(width: double.infinity,child: Center(child: Text("search error".tr()),),) :containertypesedits(data: prov.editreports),
                      
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.blue)),
                    ),
                  ),
      )

   );
  }

}