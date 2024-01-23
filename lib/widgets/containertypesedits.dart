import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/types/edittype.dart';
import 'package:fac_app/models/types/modeltype.dart';
import 'package:flutter/material.dart';

class containertypesedits extends StatelessWidget{
  List<edittypemodel>data;
containertypesedits({super.key, required this.data});
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                                      if( data[index].type!=null )    Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                            
                                    children: [
                                                                        Text("category name".tr() ),
                                                                        Text(" : "),
                            
                                 Text(data[index].typename),
                            
                                  ],),
                                 
                                                    
                                  
                                 
                               if( data[index].quantity!=null )     Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                            
                                    children: [
                                 Text(data[index].type=="اضافه"?"added category".tr():"subtract cat quantity".tr()),
                              Text(" : "),
                                   Text(data[index].quantity.abs().toString()),
                                   Text(" "),
                              
                                   Text(data[index].packet),
                                  ],),
                                 
                                                       
                                 Padding(
                                            padding: const EdgeInsets.only(left: 5,bottom: 5),
                                            child: Container(width: double.infinity,child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                                                                                                Text("store man".tr()),
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