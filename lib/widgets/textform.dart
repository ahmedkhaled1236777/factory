import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:flutter/material.dart';
class textform extends StatelessWidget{
  final TextEditingController con;
  final String valid;
  final String hinttext;
  final String suffix;
  void Function(String)? onChanged;
  final TextInputType keyboardType;
  @override
  @override
   textform({super.key, required this.con, required this.valid, required this.hinttext, required this.suffix, required this.keyboardType,this.onChanged,});
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: TextFormField(
        onChanged:onChanged ,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixStyle: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
          suffixStyle: TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
          labelStyle: TextStyle(fontSize:25,color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hinttext,
suffixText:suffix,
          hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontFamily: apptexts.appfonfamily),
contentPadding: EdgeInsets.only(left:10,right: 10)
          
        ),
        style: TextStyle(
          fontFamily: apptexts.appfonfamily
          
        ),
        controller: con,
        validator: (value) {
if(value==null||value.isEmpty)return valid;    },
      ),
    );
  }

}