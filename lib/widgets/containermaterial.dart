import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/services/material/material.dart';
import 'package:fac_app/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class containermaterial extends StatefulWidget{
 final List<materialmodel> data;
  const containermaterial({super.key, required this.data,});

  @override
  State<containermaterial> createState() => _containermaterialState();
}

class _containermaterialState extends State<containermaterial> {
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
                Text("material name".tr()),
                Text(" : "),
   
                Text(widget.data[index].material),
        
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
   
   
   
   
                             Text("bag".tr()),
   
      
        
                ],)   ,         SizedBox(height: 5,),
                IconButton(onPressed: (() async{
                  
   await materialservice.deletedata(widget.data[index].material,);
                   widget.data.removeWhere((element) => element.material== widget.data[index].material);
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