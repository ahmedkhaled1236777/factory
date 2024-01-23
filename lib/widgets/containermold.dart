import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/maintenance/maintenance.dart';

class containermoldmaintenance extends StatelessWidget{
  List<maintenancemodel> data;

   containermoldmaintenance({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
   return ListView.separated(
                        itemBuilder:((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey,),borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  
                                                      if( data[index].machinename!=null )   Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                              
                                      children: [
                              
                                      Text("mold name".tr()),
                                                                       Text(" : "),
                                                                                                        Text(data[index].machinename),
                            
                            
                                    ],),
                                   
                                  
                                 
                               if( data[index].stopreasons!=null )    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                              
                                      children: [
                              
                                      Text("failure mareason".tr()),
                                                                       Text(" : "),
                                                                                                        Text(data[index].stopreasons),
                            
                            
                                    ],),
                                   
                                 
                               if(data[index].stopreasonstime!=null)    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                              
                                      children: [
                              
                                      Text("fix time".tr()),
                                                                       Text(" : "),
                                                                                                        Text(data[index].stopreasonstime),
                            
                            
                                    ],),
                                 
                                if( data[index].notes!=null)    Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                            
                                children: [
                                          Text("notes".tr()) ,
                                 Text(" : "),
                            
                            Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal,child:data[index].notes.isNotEmpty? Text(data[index].notes):Text("notfound".tr()),)),
                                  
                                ],
                              ),
                                 Padding(
                                      padding: const EdgeInsets.only(left: 5,bottom: 5),
                                      child: Container(width: double.infinity,child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                                                                                                          Text("eng".tr()),
                                                                                  Text("/"),
                            
                                          Text("${data[index].engineer}",textAlign: TextAlign.start,),
                            
                            
                                        ],
                                      )),
                                   )
                                 
                                 
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                       separatorBuilder:((context, index) {
                         return SizedBox(height: 3,);
                       }),
                        itemCount: data.length);
  }

}