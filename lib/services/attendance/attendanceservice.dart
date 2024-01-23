import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/models/attendance/attendancemodel.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';

class attendanceservice {

static setdata(attendancemodel employee )async {
  
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("attendance").doc(employee.departement).collection("names").doc(employee.employeename).set({
            "employeename": employee.employeename, 
    "departement": employee.departement,
     "Dateofhiring": employee.Dateofhiring,
      "job": employee.job});
          
            
      }
      static  getdata(String sectionname,


      )async {
     List<String> names  = [];

    
        Query<Map<String, dynamic>> user = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("attendance").doc(sectionname).collection("names");
         await  user
           
            .get()
            .then((value) {
          value.docs.forEach((element) {
            names.add(element.data()["employeename"])    ;      });
        });
return names;     
    
  }
    
static svaeallabsence(Map absence,String sectionname,String date)async {
  
   User? user=FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("attendance").doc(sectionname).collection("absence").doc(date).set({
           
    "absence":absence,
    "date":date
          
            
      });
 
}}
 

