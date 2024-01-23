import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/maintenance/maintenance.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class macmaintenanceservice{
 static setdata(maintenancemodel maintenance, )async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("macmaintenance")
            .add({
          "date": maintenance.date,
          "shift":maintenance.shift,
          "notes":maintenance.notes,
          "name": maintenance.machinename,
          "stopreasons": maintenance.stopreasons,
          "stopreasonstime": maintenance.stopreasonstime,
          "engineername":maintenance.engineer,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
 static setmolddata(maintenancemodel maintenance, )async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("molmaintenance")
            .add({
          "date": maintenance.date,
          "shift":maintenance.shift,
          "notes":maintenance.notes,
          "name": maintenance.machinename,
          "stopreasons": maintenance.stopreasons,
          "stopreasonstime": maintenance.stopreasonstime,
          "engineername":maintenance.engineer,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }

 static  getdata(String date, String shift,


     )async {
     List<maintenancemodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("macmaintenance").orderBy("timestamp",descending: false);
         await  user
            .where("date", isEqualTo: date)
            .where("shift", isEqualTo: shift)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            reports.add(maintenancemodel.fromjson(element.data()));
          });
        });
return reports;     
    
  }
 
 static  getmolddata(String date, String shift,


      )async {
     List<maintenancemodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("molmaintenance").orderBy("timestamp",descending: false);
         await  user
            .where("date", isEqualTo: date)
            .where("shift", isEqualTo: shift)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            reports.add(maintenancemodel.fromjson(element.data()));
          });
        });
return reports;     
    
  }
 








}