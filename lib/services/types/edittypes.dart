import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/types/edittype.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class edittypesservice{

static setdata(edittypemodel production,String typename)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(typename)
            .add({
          "date": production.date,
          "engineername":production.engineer,
          "type-name": production.typename,
          "quantity":production.quantity,
          "type":production.type,
          "packet":production.packet,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
      static  getdata(String date,String typename


     )async {
     List<edittypemodel> editreports = [];

        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(typename).orderBy("timestamp",descending: false);
         await  user.where("date",isEqualTo: date)
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            
            editreports.add(edittypemodel.fromjsom(element.data()));
          });
        });
return editreports;     
    
  }}
    