import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/injection/production.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/finish/finish.dart';

class finishservice {
   static setdata(finishmodel production)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("finish")
            .add({
          "date": production.date,
          "job":production.job,
          "engineername":production.engineer,
          "shifit": production.shift,
          "workername": production.worker,
          "production-quantity": production.production,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
    

  static  getdata(String date, String shift,


      )async {
     List<finishmodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("finish").orderBy("timestamp",descending: false);
         await  user
            .where("date", isEqualTo: date)
            .where("shifit", isEqualTo: shift)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            reports.add(finishmodel.fromjson(element.data()));
          });
        });
return reports;     
    
  }
 

}