import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/quality/quality.dart';
import 'package:flutter/material.dart';

class containerquality extends StatelessWidget{
  List<qualitymodel> data;

   containerquality({super.key, required this.data});
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
                                   Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("check time".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(" : "),
                                                 Text(data[index].timehour>12?" (${data[index].timehour-12}:${data[index].timeminite}) ":"(${data[index].timehour-12}:${data[index].timeminite})",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                             Text(data[index].timehour>12?"pm".tr():"am".tr(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            
                                                ],
                                              ),
                                  
                                                      if( data[index].machinename!=null )   Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                  
                                          children: [
                                  
                                          Text("machine name".tr()),
                                                                           Text(" : "),
                                                                                                            Text(data[index].machinename),
                                
                                
                                        ],),   
                                                    
                                  
                                 
                               if( data[index].productname!=null )     Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                  
                                          children: [
                                  
                                          Text("product name".tr()),
                                                                           Text(" : "),
                                                                                                            Text(data[index].productname),
                                
                                
                                        ],),
                                 
                               if(data[index].defaul!=null)    Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                  
                                          children: [
                                  
                                          Text("defect name".tr()),
                                                                           Text(" : "),
                                                                                                            Text(data[index].defaul),
                                
                                
                                        ],), 
                                if( data[index].notes!=null)     Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                
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