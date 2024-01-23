import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/blow/write-report.dart';
import 'package:fac_app/pages/quality/newqualityreport.dart';
import 'package:fac_app/pages/quality/newshow.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newquality extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("quality-departement".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,
          bottom: TabBar(
            onTap: (index){
            },
            indicatorColor: appcolors.amcolor,
            tabs: [
            Tab(child: Text(Provider.of<categoriesprovider>(context).buttonsblowname[0],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,)),),
            Tab(child: Text(Provider.of<categoriesprovider>(context).buttonsblowname[1],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,)),),
          ]),
        ),
        body:TabBarView(children: [
newqualityreport(),          newshowqualityreports(),
        ])
      ),
    );
  }

}