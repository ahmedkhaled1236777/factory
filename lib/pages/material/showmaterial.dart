import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/widgets/containermaterial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fac_app/services/pdf/material.dart';

class showmaterialsearch extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
          var prov=Provider.of<materialprovider>(context);

    return [
      IconButton(onPressed: (() {
        query="";
      }), icon: Icon(Icons.clear)),
   
        if(prov.reports.isNotEmpty)IconButton(onPressed: ()async{
          File file=await materialpdf.generatepdf(prov.reports,"material");
          await materialpdf.openfile(file);
        }, icon: Icon(Icons.picture_as_pdf))
      ] ;
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (() {
     close(context, null);
   }), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
      List <materialmodel>material=prov.reports.where((element) => element.material.startsWith(query)).toList();
   return   material.length==0?Center(child: Text("search error".tr()),):containermaterial(data: material,);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var prov=Provider.of<materialprovider>(context);
      List <materialmodel>material=prov.reports.where((element) => element.material.startsWith(query)).toList();
      return query==""?containermaterial(data: prov.reports):containermaterial(data: material);
    
  }

}