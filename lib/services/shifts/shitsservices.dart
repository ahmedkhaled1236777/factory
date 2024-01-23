import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/shift/shift.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class shiftservice{

 static setdata(shiftmodel shift)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("shifts")
            .add({
        
          "shift-name":shift.shift,
          "departement":shift.departementname,
                    "timestamp":FieldValue.serverTimestamp()

        });}
         static  getdata( {required String departementname}


    )async {
     List<shiftmodel> shifts = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("shifts").where("departement",isEqualTo: departementname);
            await user.orderBy("timestamp",descending: false).get().then((value) {
              value.docs.forEach((element) {
                shifts.add(shiftmodel.fromjson(element.data() ));
              });
            });
return shifts;     
    
  }
  static deleteshift(String shiftname,String departementname)async{
     String ?machine_id;

   CollectionReference user = FirebaseFirestore.instance
   
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("shifts");
await user.where("departement",isEqualTo: departementname).where("shift-name",isEqualTo: shiftname).get().then((value){
  for (var element in value.docs) {
    machine_id=element.id;
    
  }
});
user.doc("${machine_id}").delete();

 }
      }
    












