import 'package:fac_app/pages/maintenance/macreports.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowmachinereport extends StatefulWidget{
  @override
  State<newshowmachinereport> createState() => _newshowmachinereportState();
}

class _newshowmachinereportState extends State<newshowmachinereport> {

 
  initializeddata()async{
           await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

              Provider.of<maintenceprovider>(context,listen: false).resetreportsdata();
             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();    
  }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return
   macreports();
  }
}