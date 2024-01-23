import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/blow/reports.dart';
import 'package:fac_app/pages/injection/reports.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/showblowprovider.dart';
import 'package:fac_app/providers/showinjectionreportprovider.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowblowreport extends StatefulWidget{
  @override
  State<newshowblowreport> createState() => _newshowblowreportState();
}

class _newshowblowreportState extends State<newshowblowreport> {


  initializeddata()async{
         await   Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "blow-departement");

              Provider.of<showblowprovider>(context,listen: false).resetdatashift();
              Provider.of<showblowprovider>(context,listen: false).resetreportsdata();
             Provider.of<showblowprovider>(context,listen: false) .resetdate(); 
  }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return
  
    blowreports();        
  }
}