import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/material/edits.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class editsmaterial{

static setdata(editmaterialmodel production)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("editmaterials")
            .add({
          "date": production.date,
          "engineername":production.engineer,
          "material-name": production.material,
          "quantity":production.quantity,
          "type":production.type,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
      static  getdata(String date,


     )async {
     List<editmaterialmodel> editreports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("editmaterials").orderBy("timestamp",descending: false);
         await  user.where("date",isEqualTo: date)
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            
            editreports.add(editmaterialmodel.fromjsom(element.data()));
          });
        });
return editreports;     
    
  }
    










}