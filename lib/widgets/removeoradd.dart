import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addbutton extends StatelessWidget{
  final String type;
final double height;
final double fontsize;
final double padding;
final Function onpressed;
 double width;
 int fontSize;
   addbutton({super.key, required this.type, required this.height, required this.onpressed, required this.fontsize, required this.padding,this.fontSize=20,this.width=double.infinity});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(padding),
      onPressed: (() {
      onpressed();
    }),child: Container(
                height: height,
                
                        decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(30)
                              ,color: Colors.purple
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),width: width,child: Text(type.tr(),textAlign: TextAlign.center,style: TextStyle(fontFamily:apptexts.appfonfamily,color: Colors.white,fontSize: fontsize),)),);
  }

}