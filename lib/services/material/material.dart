import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../notifications/allnotifications.dart';


class materialservice {
static setdata(materialmodel production, )async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("materials")
            .add({
          "date": production.date,
          "engineername":production.engineer,
          "material-name": production.material,
          "quantity":production.quantity,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
    

  static  getdata(


     )async {
     List<materialmodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("materials").orderBy("timestamp",descending: false);
         await  user
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            
            reports.add(materialmodel.fromjsom(element.data()));
          });
        });
return reports;     
    
  }
 

  static  getmaterialsnamesdata(


     )async {
     List materialnames = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("materials").orderBy("timestamp",descending: false);
         await  user
           
            .get().
            then((value) {
          value.docs.forEach((element) {
            materialnames.add(element.data()["material-name"])            ;
          });
        });
return materialnames;     
    
  }
static update(int values,String materialname,)async{
  
 CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("materials");
await user.where("material-name",isEqualTo: materialname).get().then((value){
  for (var element in value.docs) {
    materialname=element.id;
  }
});
user.doc("${materialname}").update({"quantity":FieldValue.increment(values)});
user.doc("${materialname}").get().then((value) async {
  if(value["quantity"]<=25){
    String uri=    'https://fcm.googleapis.com/fcm/send';
    var url=Uri.parse(uri);

    await http.post(
      url,
     headers: <String, String>{
       'Content-Type': 'application/json',
       'Authorization': 'key=AAAA0ckuILI:APA91bF8riQc6cm7sPPEInUL877UincbZffRx1MxkkNrrLJI15OinuhFz9_VOb3jJhyvZjNBm8nr98P-qimIzFxKzbjqj7qiEe--PjZdkiZjt9J4yDs_O6dOdVI7uYCUZJjE-jsslBUp',
     },
     body: jsonEncode(
     <String, dynamic>{
       'notification': <String, dynamic>{
         'title': "تحذير خامة "
       },
       'priority': 'high',
       'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
         'id': '1',
         'status': 'done'
       },
       'to':"/topics/${cashhelper.getstringdata("factory_id")}",
     },
    ),
  );
    allnotifications.setallnotification(value["material-name"], value["quantity"]);
  allnotifications.setnewnotification(value["material-name"], value["quantity"]);
  
  }
});

 }
 static deletedata(String materialname)async{
     String? material_id;

   CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("materials");
await user.where("material-name",isEqualTo: materialname).get().then((value){
  for (var element in value.docs) {
    material_id=element.id;
    
  }
});
user.doc("${material_id}").delete();

 }
 






}