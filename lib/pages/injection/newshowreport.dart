import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/injection/reports.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/showinjectionreportprovider.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newshowreport extends StatefulWidget{
  @override
  State<newshowreport> createState() => _newshowreportState();
}

class _newshowreportState extends State<newshowreport> {
  String?shift;

 
  initializeddata()async{
         await   Provider.of<shiftsprovider>(context,listen: false).getshifts(departementname: "injection-departement");

              Provider.of<showinjectionprovider>(context,listen: false).resetdatashift();
              Provider.of<showinjectionprovider>(context,listen: false).resetreportsdata();
             Provider.of<showinjectionprovider>(context,listen: false) .resetdate(); 
  }
  @override
  void initState() {
initializeddata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return  injectionreports();
        
      
  }
}