import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class datebutton extends StatelessWidget{
 String date;
 final Function onpressed;
  datebutton({required this.onpressed, required this.date});
  @override

  Widget build(BuildContext context) {
    return     InkWell
(
  onTap: (() {
    onpressed();
  }),
  
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: appcolors.amcolor,
            borderRadius: BorderRadius.circular(10)
          ),
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
               Padding(
                 padding: context.locale==Locale("en")? EdgeInsets.only( left: 5):EdgeInsets.only( right: 5),
                 child: Icon(Icons.calendar_month,color: Colors.white,),
               ),
              Expanded(child:Padding(
                padding: context.locale==Locale("en")? EdgeInsets.only(right: 40):EdgeInsets.only( left: 40 ),
                child: Text(date.tr(),style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: apptexts.appfonfamily),textAlign: TextAlign.center,),
              )),
             
            ],
          ),
        ),
      ),
    );
  }

}