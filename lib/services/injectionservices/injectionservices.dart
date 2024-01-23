import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/injection/production.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/categories/gridcategories.dart';

class injectionservice {
  static setdata(productionmodel production)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("injection")
            .add({
          "date": production.date,
          "engineername":production.engineer,
          "machine-name": production.machinename,
          "shifit": production.shift,
          "workername": production.worker,
          "mold": production.mold,
          "cycle-time": production.cycle_time,
          "production-quantity": production.production,
          "scrap-quantity": production.scrap,
          "stop-reasons": production.stopreason,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
    

  static  getdata(String date, String shift,


      )async {
     List<productionmodel> reports = [];

    
        CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("injection");
         await  user.orderBy("timestamp",descending: false)
            .where("date", isEqualTo: date)
            .where("shifit", isEqualTo: shift)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            reports.add(productionmodel.fromjson(element));
          });
        });
return reports;     
    
  }
}
