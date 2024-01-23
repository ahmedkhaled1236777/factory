import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridcard extends StatelessWidget{
  final String name;
  final String image;
final Widget screen;
  const gridcard({super.key, required this.name, required this.image, required this.screen});
  @override
  Widget build(BuildContext context) {
   return   InkWell
(
  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
    return screen;
  })));},
       child: Card(
      color: appcolors.amcolor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
        
          Expanded(child:Container(
            
     
      width: double.infinity,child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),child: Image.asset(image,fit: BoxFit.fill,)))),
          Container(height: 30,child: Center(child: Text(name.tr(),softWrap: true,style: TextStyle(fontSize: context.locale==Locale("en")?12:15,color:Colors.white,fontWeight: FontWeight.bold,fontFamily: "cairo",overflow: TextOverflow.ellipsis),)))
   
        ],
      ),
     ),
   );
  }

}