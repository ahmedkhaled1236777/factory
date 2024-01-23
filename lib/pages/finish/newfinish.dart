import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/finish/newshowfinishreport.dart';
import 'package:fac_app/pages/finish/writereport.dart';
import 'package:fac_app/pages/injection/write-report.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newfinish extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("finish-departement".tr(),style: TextStyle(fontFamily:apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,
          bottom: TabBar(
            onTap: (index){
            },
            indicatorColor: appcolors.amcolor,
            tabs: [
            Tab(child: Text(Provider.of<categoriesprovider>(context).buttonsinjectionname[0],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,)),),
            Tab(child: Text(Provider.of<categoriesprovider>(context).buttonsinjectionname[1],style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,)),),
          ]),
        ),
        body:TabBarView(children: [
newfinishreport(),          newshowfinishreport(),
        ])
      ),
    );
  }

}