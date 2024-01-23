import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/types/completetypesreports.dart';
import 'package:fac_app/pages/types/neweditcompletetype.dart';
import 'package:fac_app/pages/types/newshowcompletetype.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newcompletetypes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Completed product store".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            onTap: (index){
            },
            indicatorColor: appcolors.amcolor,
            tabs: [
            Tab(child: Center(child: Text(Provider.of<categoriesprovider>(context).buttonstypesname[0],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily))),),
            Tab(child: Center(child: Text(Provider.of<categoriesprovider>(context).buttonstypesname[1],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,))),),
            Tab(child: Center(child: Text(Provider.of<categoriesprovider>(context).buttonstypesname[2],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,))),),
          ]),
        ),
        body:
        
        TabBarView(children: [
newshowcompletetypes(),neweditcompletetypes(),completetypeseditreports()
        ])
      ),
    );
  }

}