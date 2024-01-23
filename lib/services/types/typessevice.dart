import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/types/modeltype.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class typesservice {
static setdata(typemodel production,String sectionname )async {
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(sectionname)
            .add({
          "date": production.date,
          "engineername":production.engineer,
          "type-name": production.type,
          "quantity":production.quantity,
          "packet":production.packet,
          "barcode":production.barcode,
                    "timestamp":FieldValue.serverTimestamp()

        });
      }
    

  static  getdata(

{required String sectionname}
     )async {
     List<typemodel> reports = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(sectionname).orderBy("timestamp",descending: false);
         await  user
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            
            reports.add(typemodel.fromjsom(element.data()));
          });
        });
return reports;     
    
  }
 

  static  gettypesnamesdata(
{required String sectionname}

     )async {
     Map typesnames = {};

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(sectionname).orderBy("timestamp",descending: false);
         await  user
           
            .get().
            then((value) {
          value.docs.forEach((element) {
            typesnames.addAll({element.data()["barcode"]:element.data()["type-name"]})            ;
          });
        });
return typesnames;     
    
  }
static update(int values,String typename,String sectionname)async{

 CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(sectionname);
await user.where("type-name",isEqualTo: typename).get().then((value){
  for (var element in value.docs) {
    typename=element.id;
    
  }
});
user.doc("${typename}").update({"quantity":FieldValue.increment(values)});


 }
 static deletedata(String materialname,String sectionname)async{
     String? material_id;

   CollectionReference user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection(sectionname);
await user.where("type-name",isEqualTo: materialname).get().then((value){
  for (var element in value.docs) {
    material_id=element.id;
    
  }
});
user.doc("${material_id}").delete();

 }
 






}