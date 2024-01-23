import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/material/newedit.dart';
import 'package:fac_app/pages/material/newshowedits.dart';
import 'package:fac_app/pages/material/newshowmaterials.dart';
import 'package:flutter/material.dart';

class newmachines extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("add machines".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            onTap: (index){
            },
            indicatorColor: appcolors.amcolor,
            tabs: [
            Tab(child: Center(child: Text("add machines".tr(),style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily))),),
            Tab(child: Center(child: Text("show injection machines".tr(),style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,))),),
            Tab(child: Center(child: Text("show blow machines".tr(),style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,))),),
          ]),
        ),
        body:TabBarView(children: [
newshowmaterials(),          newedit(), mateialeditreports()
        ])
      ),
    );
  }

}