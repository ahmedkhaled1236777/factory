import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/machines/machinesmodel.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class machinesservice{
 static setdata(machinesmodel production,String departementname)async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(departementname)
            .add({
        
          "machine-name":production.name,
          "timestamp":FieldValue.serverTimestamp()
        });
      }
    

  static  getdata( String departementname,


    )async {
     List<machinesmodel> machines = [];

    
        CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(departementname);
         await  user.orderBy("timestamp",descending: false)
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            machines.add(machinesmodel.fromjson(element.data()));
          });
        });
return machines;     
    
  }
  static deletemachine(String machinename,String departementname,{String ?factory_id})async{
     String ?machine_id;

   CollectionReference user = FirebaseFirestore.instance
   
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(departementname);
await user.where("machine-name",isEqualTo: machinename).get().then((value){
  for (var element in value.docs) {
    machine_id=element.id;
    
  }
});
user.doc("${machine_id}").delete();

 }
 




}