import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/machines/machinesmodel.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/services/machines.dart/machinesservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class containermachines extends StatefulWidget{
  List<machinesmodel>data;
   String departementname;
containermachines({super.key, required this.data,  required this.departementname});

  @override
  State<containermachines> createState() => _containermachinesState(data: data,departementname: departementname);
}

class _containermachinesState extends State<containermachines> {
  final  List<machinesmodel>data;
     final     String departementname;

  _containermachinesState({required this.data, required this.departementname});



  @override
  Widget build(BuildContext context) {
   return ListView.separated(
                        itemBuilder:((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey,),borderRadius: BorderRadius.circular(10)),
                            child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,                              children: [
                                
                 
                               Padding(
                                 padding: const EdgeInsets.only(right: 5,left: 5),
                                 child: Row(
                                   children: [
                                    Text("machine".tr()),
                                    Text(" : "),
                                     Text(widget.data[index].name),
                                   ],
                                 ),
                               ),
                                        if( widget.data[index].name!=null )    

                                 IconButton(onPressed: (() async{
                                                   var pref =await SharedPreferences.getInstance();
                                    String? factory_id=pref.getString("factory-id");
                                    machinesservice.deletemachine(data[index].name,departementname,factory_id: factory_id);
                                                    widget.data.removeWhere((element) => element.name== widget.data[index].name);
                                       setState(() {
                                         
                                       });
                                                 }), icon: Icon(Icons.delete)),

                                
                                  
                               
                        
                                
                               
                            
                              ],
                            ),
                          ),
                        );
                      }),
                       separatorBuilder:((context, index) {
                         return SizedBox(height: 3,);
                       }),
                        itemCount: widget.data.length);
  }
}