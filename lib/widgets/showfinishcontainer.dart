import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/finish/finish.dart';
import 'package:flutter/material.dart';

import '../models/injection/production.dart';

class finishcontainerreport extends StatelessWidget{
  final List<finishmodel> data;

  const finishcontainerreport({super.key, required this.data});
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
                                           
                                                  
                                  
                                  
                                                  
                                 
                                                   if( data[index].worker!=null )          Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                              
                                      children: [
                                                                          Text("worker-name".tr()),
                                                                                                                                               Text(" : "),
                            
                                                                          
                              
                                   Text( data[index].worker),
                              
                                    ],),
                                    
                                   
                                                   if( data[index].worker!=null )          Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                              
                                      children: [
                                                                          Text("job".tr()),
                                                                                                                                               Text(" : "),
                            
                                                                          
                              
                                   Text( data[index].job),
                              
                                    ],),
                                    
                                             
                                                     
                                 
                                                    if( data[index].worker!=null )          Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                              
                                      children: [
                                                                          Text("production qyantity".tr()),
                                                                                                                                               Text(" : "),
                            
                                                                          
                              
                                   Text( "${data[index].production}"),
                              
                                    ],),
                                    
                                   
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