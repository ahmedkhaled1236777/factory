import 'package:fac_app/pages/quality/reports.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowqualityreports extends StatefulWidget{
  @override
  State<newshowqualityreports> createState() => _newshowqualityreportsState();
}

class _newshowqualityreportsState extends State<newshowqualityreports> {


  initializeddata()async{
        await     Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "quality-departement");

 

              Provider.of<qualityprovider>(context,listen: false).resetdatashift();
              Provider.of<qualityprovider>(context,listen: false).resetreportsdata();
             Provider.of<qualityprovider>(context,listen: false) .resetdate(); }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return
  
    qualityreports();        


  
  }}