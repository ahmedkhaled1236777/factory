import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/quality/quality.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class qualityservice {
   static setdata(qualitymodel production, {String? factory_id})async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("quality")
            .add({
          "date": production.date,
          "notes":production.notes,
          "engineername":production.engineer,
          "shifit": production.shift,
          "default": production.defaul,
          "product-name": production.productname,
          "timehour":production.timehour,
          "timeminite":production.timeminite,
          "machine-name":production.machinename,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
    

  static  getdata(String date, String shift,


   )async {
     List<qualitymodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("quality").orderBy("timestamp",descending: false);
         await  user
            .where("date", isEqualTo: date)
            .where("shifit", isEqualTo: shift)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            reports.add(qualitymodel.fromjson(element.data()));
          });
        });
return reports;     
    
  }
 

}