import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class allnotifications{
  static setallnotification(String materialname,int quantity){
    String material="material";
    
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("allnotifications")
            .add({
         
          "timestamp":DateTime.now().toString(),
          "material name":"${materialname}",
          "quantity":quantity
          });}
  static setnewnotification(String materialname,int quantity){
    
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("newnotifications")
            .add({
         
          "timestamp":DateTime.now().toString(),
          "material name":"${materialname}",
          "quantity":quantity
          });}
  static deletenewnotification() async {
    
   CollectionReference notifications = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("newnotifications");
await notifications.get().then((value){
  for (var element in value.docs) {
    notifications.doc(element.id).delete();
  }
});

            
  }
  static getallnotification(){
    Stream<QuerySnapshot<Map<String, dynamic>>> allnotifications=FirebaseFirestore.instance.collection("factories").doc(cashhelper.getstringdata("factory_id")).collection("allnotifications").orderBy("timestamp",descending: true).snapshots();
    return allnotifications;
  }
        

  
}