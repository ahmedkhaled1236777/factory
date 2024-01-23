import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/finish/reports.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/showfinishprovider.dart';
import 'package:fac_app/services/pdf/finishpdf.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowfinishreport extends StatefulWidget{
  @override
  State<newshowfinishreport> createState() => _newshowfinishreportState();
}

class _newshowfinishreportState extends State<newshowfinishreport> {

 
  initializeddata()async{
         await   Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "finish-departement");

              Provider.of<showfinishprovider>(context,listen: false).resetdatashift();
              Provider.of<showfinishprovider>(context,listen: false).resetreportsdata();
             Provider.of<showfinishprovider>(context,listen: false) .resetdate(); 
  }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return
   finishreports();
  }
}