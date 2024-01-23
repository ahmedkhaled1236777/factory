import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class user_service{
static set_users(String imagename,String factory_id,String email,String role,String user_name,String uid,bool block,String phone)async{
  User? user=FirebaseAuth.instance.currentUser;
await FirebaseFirestore.instance.collection('users').doc(uid).set({
  "imagename":imagename,
"email":email,
"uid":uid,
"user_name":user_name,
"factory_id":factory_id,
"role":role,
"block":block,
"phone":phone,
 "timestamp":FieldValue.serverTimestamp()

}); 
}
static getdata()async{
    List<usermodel>users=[];

Query<Map<String, dynamic>> user= FirebaseFirestore.instance.collection("users").orderBy("timestamp",descending: false);
await user.get().then((value) {
value.docs.forEach((element) {
  users.add(usermodel.fromjson(element.data()));
});



  
});

return users;


}

static getsubusers(String factory_id,String email)async{
   List<usermodel> subuser=[];

Query<Map<String, dynamic>> subusers=FirebaseFirestore.instance.collection("users").orderBy("timestamp",descending: false);
await subusers.where("factory_id",isEqualTo:factory_id ).get().then((value) {
value.docs.forEach((element) {
  
if(email!=element["email"])  subuser.add(usermodel.fromjson(element.data()));
});
});
return subuser;
}
static deletesubuser(String email,String uid)async{
   DocumentReference user = FirebaseFirestore.instance
            .collection("users").doc(uid);
            

 await user.delete();


}




}