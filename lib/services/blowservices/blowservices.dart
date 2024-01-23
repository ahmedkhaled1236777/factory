
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/injection/production.dart';


class blowservice {
  static setdata(productionmodel production)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("blowing")
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

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("blowing").orderBy("timestamp",descending: false);
         await  user
            .where("date", isEqualTo: date)
            .where("shifit", isEqualTo: shift)
            .get()
            .then((value) {

          value.docs.forEach((element) {
            
            reports.add(productionmodel.fromjson(element.data()));
          });
        });
return reports;     
    
  }
}
