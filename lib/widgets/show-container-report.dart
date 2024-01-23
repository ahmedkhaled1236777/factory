import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/injection/production.dart';

class containerreport extends StatelessWidget{
  List<productionmodel> data;

   containerreport({super.key, required this.data});
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
                                  
                                                      if( data[index].machinename!=null )    Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                            
                                    children: [
                            
                                    Text("machine name".tr()),
                                                                     Text(" : "),
                                                                                                      Text(data[index].machinename),


                                  ],),
                                 
                                                    if( data[index].worker!=null )          Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                        Text("worker-name".tr()),
                                                                                                                                             Text(" : "),

                                                                        
                            
                                 Text( data[index].worker),
                            
                                  ],),
                                  
                                 
                               if( data[index].mold!=null )     Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                          Text("mold name".tr()),
Text(" : "),
                                 Text(data[index].mold),
                            
                                  ],),
                                 
                               if(data[index].production!=null)     Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                          Text("production qyantity".tr()),
Text(" : "),
                                 Text("${(data[index].production)}"),
                            
                                  ],),
                                 
                                if( data[index].scrap!=null)    Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                          Text("scrap qyantity".tr()),
Text(" : "),
                                 Text("${data[index].scrap}"),
                            
                                  ],),
                                 if( data[index].cycle_time!=null)   Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                          Text("cycle time".tr()),
                                                                          Text(" : "),

                                 Text("${data[index].cycle_time}"),
                            
                                  ],),
                                                      
                                 if( data[index].stopreason!=null )   Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                                                          Text("machine malfunctions".tr(),),
                                                                          Text(" : "),

                                 Expanded(child: Text(data[index].stopreason,textAlign: TextAlign.start,)),
                            
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