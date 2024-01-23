import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/pages/attendance/attendance.dart';
import 'package:fac_app/pages/types/newalltypes.dart';
import 'package:fac_app/pages/advertesments/advertesments.dart';
import 'package:fac_app/pages/blow/blowing_page.dart';
import 'package:fac_app/pages/blow/newblow.dart';
import 'package:fac_app/pages/finish/finish-page.dart';
import 'package:fac_app/pages/finish/newfinish.dart';
import 'package:fac_app/pages/injection/injection-page.dart';
import 'package:fac_app/pages/injection/newinjection.dart';
import 'package:fac_app/pages/maintenance/maintenance-page.dart';
import 'package:fac_app/pages/maintenance/newmaintenamnce.dart';
import 'package:fac_app/pages/material/material.dart';
import 'package:fac_app/pages/material/newmaterial.dart';
import 'package:fac_app/pages/quality/newquality.dart';
import 'package:fac_app/pages/quality/quality-page.dart';
import 'package:fac_app/pages/settings/settings.dart';
import 'package:fac_app/pages/types/newtypes.dart';
import 'package:fac_app/pages/users/myusers.dart';
import 'package:fac_app/providers/languageprovider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class categoriesprovider extends ChangeNotifier{
List <String>adverts=[];
bool adver=true;
List screans=[newinjection(),newblow(),newfinish(),newmaintenance(),newquality()];
 List cat=[{
   "name":"injection-departement",
   "image": "images/m2.jpeg",
   "screen":newinjection()
  },
  {
   "name": "blow-departement",
   "image": "images/n.jpeg",
   "screen":newblow()
  },
  {
   "name":"finish-departement",
   "image": "images/t.jpeg",
   "screen":newfinish()
  },
  {
   "name":"maintenance-departement",
   "image": "images/ma.jpeg",
   "screen":newmaintenance()
  },
  {
   "name": "quality-departement",
   "image": "images/f.jpeg",
   "screen":newquality()
  },
  {
   "name":"material-departement",
   "image": "images/m.jpg",
   "screen":newmaterial()
  },
  {
   "name": "categories-departement",
   "image": "images/b.jpg",
      "screen":alltypes()

  },
  {
   "name": "attendance-departement",
   "image": "images/attend.png",
      "screen":attendance()

  },
  
  
  
  
  
  ];
 List manager=[{
   "name": "injection-departement",
   "image": "images/m2.jpeg",
   "screen":newinjection()
  },
  {
   "name": "blow-departement",
   "image": "images/n.jpeg",
   "screen":newblow()
  },
  {
   "name":"finish-departement",
   "image": "images/t.jpeg",
   "screen":newfinish()
  },
  {
   "name":"maintenance-departement",
   "image": "images/ma.jpeg",
   "screen":newmaintenance()
  },
  {
   "name":"quality-departement",
   "image": "images/f.jpeg",
   "screen":newquality()
  },
  {
   "name":"material-departement",
   "image": "images/m.jpg",
   "screen":newmaterial()
  },
  {
   "name": "categories-departement",
   "image": "images/b.jpg",
      "screen":alltypes()

  },
  
  {
    "name":"users",
       "image": "images/u.jpg",
       "screen":myusers()


  },
  {
    "name":"adever",
       "image": "images/adver.jpg",
       "screen":advertesments()


  },
   {
   "name": "attendance-departement",
   "image": "images/attend.png",
      "screen":attendance()

  },
  
  
  
  ];
  List injectionengineer=[{
   "name": "injection-departement",
   "image": "images/m2.jpeg",
   "screen":newinjection()
  }];
  List blowingengineer=[
   {
   "name": "blow-departement",
   "image": "images/n.jpeg",
   "screen":newblow()
  },
  ];
  List finishengineer=[{
   "name":"finish-departement",
   "image": "images/t.jpeg",
   "screen":newfinish()
  },];
  List qualityengineer=[
    {
   "name":"quality-departement",
   "image": "images/f.jpeg",
   "screen":newquality()
  },
  ];
  List maintenanceengineer=[
    {
   "name":"maintenance-departement",
   "image": "images/ma.jpeg",
   "screen":newmaintenance()
  },
  ];
  List materialperson=[
    {
   "name":"material-departement",
   "image": "images/m.jpg",
   "screen":newmaterial()
  },
    
  ];
  List typesperson=[
   {
   "name": "categories-departement",
   "image": "images/b.jpg",
      "screen":alltypes()

  },
  ];
  List productionmanager=[{
   "name": "injection-departement",
   "image": "images/m2.jpeg",
   "screen":newinjection()
  },
  {
   "name":"blow-departement",
   "image": "images/n.jpeg",
   "screen":newblow()
  },
  {
   "name":"finish-departement",
   "image": "images/t.jpeg",
   "screen":newfinish()
  },];
bool Switch=true;
  List grid=[];
  String? role;
  getgrid({required String role,required List grid}){
    this.grid=grid;
    this.role=role;
ChangeNotifier();
;
  }
getadvertesmentas()async{
  
await FirebaseFirestore.instance.collection("advertesments").orderBy("timestamp",descending: false).get().then((value) {
  value.docs.forEach((element) {
    adverts.add(element.data()["image"]);
  });
});
print(adverts);
  adver=false;

  notifyListeners();
}
 List buttonsinjectionname=["write injection reports".tr(),"show injection reports".tr()];
 List buttonsmaterialname=["show materials".tr(),"modification of materials".tr(),"show modifications".tr()];
 List buttonstypesname=["show   types".tr(),"modification of types".tr(),"show   tmodifications".tr()];
 List buttonsblowname=["write injection reports".tr(),"show injection reports".tr()];
 List buttonsfinishname=["write finish reports","show finish reports"];
List maintenancebutton=["writemchine".tr(),"showmachine".tr(),"writemold".tr(),"showmold".tr()];
List buttonsettings=["Add or delete shifts".tr(),"Add or delete machines".tr(),"Add or delete users".tr(),];
List qualitybutton=["write quality  reports","show quality  reports"];
int index=0;
changedot(int val){
index=val;
notifyListeners();
}

}