
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/widgets/containermold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fac_app/services/pdf/machinemaintenancepdf.dart';

import '../../providers/maintenanceprovider.dart';
import '../../widgets/gradient.dart';

class molreports extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<maintenceprovider>(context);
   return Scaffold(
     appBar: AppBar(title: Text("reports".tr(),style: TextStyle(fontSize: 20)),actions: [
        if(prov.reports.isNotEmpty)IconButton(onPressed: ()async{
          File file=await maintenancepdf.generatepdf(prov.moldreports, "mold", "اسم الاسطمبه");
          await maintenancepdf.openfile(file);
        }, icon: Icon(Icons.picture_as_pdf))
      ]),
      body:    gradients(
        child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Card(
                   child:prov.reports .isEmpty?Container(width: double.infinity,child: Center(child: Text("no data".tr()),),) : containermoldmaintenance(data: Provider.of<maintenceprovider>(context).moldreports),
                      
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.blue)),
                    ),
                  ),
      )

   );
  }}