import 'package:cloud_firestore/cloud_firestore.dart';

class usermodel {
  final String email;
  final bool block;
  final String role;
  final String user_name;
  final String factory_id;
  final String uid;
  final String phone;
  usermodel({required this.uid, required this.user_name, required this.email,required this.block,required this.factory_id,required this.role,required this.phone, });
  factory usermodel.fromjson(data){
    return usermodel(email: data["email"],
    phone: data["phone"],
    uid: data["uid"],
     block: data["block"], 
     user_name: data["user_name"],
     role: data["role"],
      factory_id:data["factory_id"]);
  
  }
  
}