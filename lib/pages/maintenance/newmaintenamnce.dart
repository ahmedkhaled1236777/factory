import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/finish/newshowfinishreport.dart';
import 'package:fac_app/pages/finish/writereport.dart';
import 'package:fac_app/pages/maintenance/newshowmachinereport.dart';
import 'package:fac_app/pages/maintenance/newshowmoldreport.dart';
import 'package:fac_app/pages/maintenance/newwritemachinereport.dart';
import 'package:fac_app/pages/maintenance/newwritemold.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newmaintenance extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("maintenance-departement".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,
          bottom: TabBar(
            isScrollable: true,
            onTap: (index){
            },
            indicatorColor: appcolors.amcolor,
            tabs: [
            Tab(child: Text(Provider.of<categoriesprovider>(context).maintenancebutton[0],softWrap: true,style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,overflow: TextOverflow.ellipsis)),),
            Tab(child: Text(Provider.of<categoriesprovider>(context).maintenancebutton[1],softWrap: true,style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,overflow: TextOverflow.ellipsis)),),
            Tab(child: Text(Provider.of<categoriesprovider>(context).maintenancebutton[2],softWrap: true,style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,overflow: TextOverflow.ellipsis)),),
            Tab(child: Text(Provider.of<categoriesprovider>(context).maintenancebutton[3],softWrap: true,style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily,overflow: TextOverflow.ellipsis)),),
          ]),
        ),
        body:TabBarView(children: [
newmachinereport(),          newshowmachinereport(),newwritemoldreport(),newshowmoldreport(),
        ])
      ),
    );
  }

}