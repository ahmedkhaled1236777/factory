import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categoriebutton extends StatelessWidget{
  final String buttontext;
final double height;
final Function onPressed;
  const categoriebutton({super.key, required this.buttontext,required this.height, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
   return Padding(
    
     padding: const EdgeInsets.symmetric(horizontal: 10),
     child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))
      ),
      onPressed:(() {
       onPressed();
     }), child:Container(width: double.infinity,height: height,child: Center(child: Text(buttontext.tr(),style: TextStyle(fontSize: 20,color: Colors.white),))),),
   );
  }

}