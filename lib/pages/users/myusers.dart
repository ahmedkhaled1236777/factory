import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myusers extends StatelessWidget{
  
  Query<Map<String, dynamic>> users=FirebaseFirestore.instance.collection("users").where("role",isEqualTo: "manager");
    @override
  Widget build(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(builder:(context,snapshot){
    List<usermodel>managers=[];
    if(snapshot.hasData){
for (var element in snapshot.data!.docs) {
managers.add(usermodel.fromjson(element.data()));
  
}
return Scaffold(
  body:   ListView.separated(itemBuilder: (context,Index){
  
  return Card(child: Row(children: [
  
  Expanded(child: Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Text(managers[Index].user_name),
  )),
  Expanded(child: managers[Index].block==true?Text("blocked",style: TextStyle(color: Colors.red),):Text("un blocked",)),
  
  Expanded(
    child: TextButton(onPressed: (){
    String factory_id;
    Future<DocumentSnapshot<Map<String, dynamic>>> ref= FirebaseFirestore.instance.collection("users").doc(snapshot.data!.docs[Index].id).get();
  ref.then((value) {
   factory_id= value["factory_id"];
   Query<Map<String, dynamic>> users=FirebaseFirestore.instance.collection("users").where("factory_id",isEqualTo: factory_id);
   users.get().then((value){
    for (var element in value.docs) {
      FirebaseFirestore.instance.collection("users").doc(element.id).update({"block":element["block"]==true?false:true});
    }
   });
  });
    
    
    }, child:Text("تغيير")),
  )
  
  ],),);
  
  }, separatorBuilder: (context,Index){
  
    return SizedBox(height: 10,);
  
  
  
  }, itemCount: managers.length),
);
    }
    else return Scaffold(body: Center(child: CircularProgressIndicator(),));

   },
   stream: users.snapshots(), );
  }






}