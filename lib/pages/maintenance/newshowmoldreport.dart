import 'package:fac_app/pages/maintenance/newmoldreport.dart';
import 'package:fac_app/pages/maintenance/newwritemold.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowmoldreport extends StatefulWidget{
  @override
  State<newshowmoldreport> createState() => _newshowmoldreportState();
}

class _newshowmoldreportState extends State<newshowmoldreport> {

 
  initializeddata()async{
       await             Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "maintenance-departement");

             Provider.of<maintenceprovider>(context,listen: false).resetdatashift();
           Provider.of<maintenceprovider>(context,listen: false) .resetdate();    
           Provider.of<maintenceprovider>(context,listen: false) .resetmoldreportsdata();    
  }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return
   newmoldreport();
  }
}