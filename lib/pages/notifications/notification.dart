import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/models/notifications/notificationmodel.dart';
import 'package:fac_app/services/notifications/allnotifications.dart';
import 'package:flutter/material.dart';

import '../../widgets/gradient.dart';

class notifications extends StatelessWidget{
  final int number;
   notifications( {required this.number});

  @override
  Widget build(BuildContext context) {
    print(number);
    return Padding(
      padding: const EdgeInsets.only(top: 8,right: 5,left: 5),
      child: Scaffold(
        body:gradients(
          child: StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
            if(snapshot.hasData){
              List<notificationmodel>notifications=[];
              for (var element in snapshot.data!.docs) {
                notifications.add(notificationmodel.fromjsom(element.data()));
                
              }
              return notifications.isEmpty?Center(child: Text("no notifications".tr()),) :ListView.separated(itemBuilder: ((context, index) {
              return Card(
                color:number>index?Colors.blue.withOpacity(0.9):Colors.white,
                elevation: 3,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,                children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
Text("material".tr()),
                              Text(" "),
Text("${notifications[index].materialname}"),
Text(" "),
Text("become".tr()),
Text(" "),

   Text("${notifications[index].quantity}"),
   Text(" "),
   Text("bag".tr())





                            ],
                          ),
                        
                      Text("${notifications[index].time.toString().split('.')[0]}"),
                    ],
                  ),
                ),
              );
              
            }), separatorBuilder:((context, index) {
              return SizedBox(height: 2,);
            }), itemCount: notifications.length);
            }
            else return Center(child:CircularProgressIndicator(),);
            
          },stream:allnotifications.getallnotification() ,),
        ) ,
      ),
    );
  }

  
}