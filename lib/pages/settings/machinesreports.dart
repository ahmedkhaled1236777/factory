import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/widgets/containermachines.dart';
import 'package:flutter/material.dart';

import '../../models/machines/machinesmodel.dart';
import '../../widgets/gradient.dart';

class machinesreports extends StatelessWidget{
final List<machinesmodel>data;
  final String departementname;
  final String appBar;

  const machinesreports({super.key, required this.data, required this.departementname, required this.appBar});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(appBar.tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:apptexts.appfonfamily),),backgroundColor: appcolors.kprimarycolor,),
      body:    Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                  child: Card(
                 child:data.isEmpty||data==null?Container(width: double.infinity,child: Center(child: Text("no machines".tr()),),) : containermachines(data: data, departementname: departementname,),
                    
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.blue)),
                  ),
                )
 
    );
  }

}