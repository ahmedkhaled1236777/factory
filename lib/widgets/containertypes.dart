import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/types/modeltype.dart';
import 'package:fac_app/services/types/typessevice.dart';
import 'package:flutter/material.dart';

import 'gradient.dart';

class containertypes extends StatefulWidget{
 final List<typemodel> data;
 final String sectionname;

  const containertypes({super.key, required this.data,required this.sectionname});
  @override
  State<containertypes> createState() => _containertypesState();
}

class _containertypesState extends State<containertypes> {
  @override
  Widget build(BuildContext context) {
   return ListView.separated(itemBuilder: ((context, index) {
     return  Padding(
       padding: const EdgeInsets.only(left: 5,right: 5),
       child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                                                     SizedBox(height: 5,),
      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
   Text("category name".tr()),
                Text(" : "),
   
                Text(widget.data[index].type),
                ],),
                                                     SizedBox(height: 5,),
      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
   
               Text("storage start".tr()),
                                     Text(" : "),
   
   
                Text(widget.data[index].date),
        
                ],),
                SizedBox(height: 5,),
         Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                               Text("quantity".tr()),
                                                              Text(" : "),
                                                                                Text(widget.data[index].quantity.toString()),
                                                                                                               Text(" "),
   
   
   
   
                             Text(widget.data[index].packet),
   
        
                ],)   ,         SizedBox(height: 5,),
         Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                               Text("barcode".tr()),
                                                              Text(" : "),
                                                                                Text(widget.data[index].barcode.toString()),
   
   
   
   
   
        
                ],)   ,         SizedBox(height: 5,),
                IconButton(onPressed: (() async{
                  
   await typesservice.deletedata(widget.data[index].type,widget.sectionname);
                   widget.data.removeWhere((element) => element.type== widget.data[index].type);
      setState(() {
        
      });
                }), icon: Icon(Icons.delete)),
                SizedBox(height: 5,)
               
              ],
            ),
          ),
        ),
     );
    }), 
    separatorBuilder: ((context, index) {
      return SizedBox(height: 5,);
    }), 
    itemCount: widget.data.length);
  }
}