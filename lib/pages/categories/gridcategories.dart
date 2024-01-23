import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/main.dart';
import 'package:fac_app/pages/login/changepassword0.dart';
import 'package:fac_app/pages/login/login.dart';
import 'package:fac_app/pages/login/resetpassword.dart';
import 'package:fac_app/pages/material/addmaterial.dart';
import 'package:fac_app/pages/notifications/notification.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/providerid.dart';
import 'package:fac_app/services/notifications/allnotifications.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/gridcard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/gradient.dart';

class gridcategories extends StatefulWidget{
  final List grid;
final String role;
   gridcategories({super.key, required this.grid,required this.role});

  @override
  State<gridcategories> createState() => _gridcategoriesState();

}

class _gridcategoriesState extends State<gridcategories> {
  int noty=0;

  Stream<QuerySnapshot<Map<String, dynamic>>> material = FirebaseFirestore.instance
            .collection("factories")
            .doc(cashhelper.getstringdata("factory_id"))
            .collection("newnotifications").orderBy("timestamp",descending: false).snapshots();
  
   

  @override
  void initState() {

    if(widget.role=="manager"||widget.role=="admin"){FirebaseMessaging.onMessage.listen((message) {
  AwesomeNotifications().createNotification(content: NotificationContent(id: Provider.of<providerid>(context,listen: false).id, channelKey: "basickey",title: message.notification!.title));
   Provider.of<providerid>(context,listen: false).increaseid();
     });
    
  };
   FirebaseMessaging.onMessageOpenedApp.listen((event) async {
       await allnotifications.deletenewnotification();
   Navigator.of(context).push(MaterialPageRoute(builder: (_){
    return notifications(number: noty,);
   }));
     });}
  

  
  @override
  Widget build(BuildContext context) {
     var prov=Provider.of<materialprovider>(context) ;

    return Scaffold(
     
      appBar: AppBar(title: Text("main".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
      actions: [if(widget.role=="manager"||widget.role=="admin")
Center(
  child:  badges.Badge(
    position: badges.BadgePosition.topStart(start: 7,top: -1),
    child: IconButton(onPressed: (()async {
   await allnotifications.deletenewnotification();
   Navigator.of(context).push(MaterialPageRoute(builder: (_){
    return notifications(number: noty,);
   }));
    }), icon: Icon(Icons.notifications)),
    badgeContent: StreamBuilder(builder:((context, snapshot) {
     
      if(snapshot.hasData){
      noty =snapshot.data!.size;
      return Text("${snapshot.data!.size}",style: TextStyle(color: Colors.white));}
      else return Text("0",style: TextStyle(color: Colors.white),);
      
    }) ,stream: material,),
  ),
)   ],

leading:IconButton(onPressed: (){
        showModalBottomSheet(
          backgroundColor: Colors.black38.withOpacity(0),
          context: context, builder: ((context) {
          return Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Container(height: 300,decoration:BoxDecoration(color: Colors.blue.withOpacity(1),borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),child: Column(
crossAxisAlignment:context.locale==Locale("en")? CrossAxisAlignment.start:CrossAxisAlignment.start,              children: [
TextButton(onPressed: (()async {
  User? user=FirebaseAuth.instance.currentUser;
  if(user!=null) await FirebaseAuth.instance.signOut();
  
  Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
  
}), child: Text("logout".tr(),style: TextStyle(color: Colors.white,fontSize: 20),)),
SizedBox(height: 5,),
TextButton(onPressed: (() {
   Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
    return changepassword();
  })));
}), child: Text("repassword".tr(),style: TextStyle(color: Colors.white,fontSize: 20),)),
SizedBox(height: 5,),
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 7,),
    Text("contactus".tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    SizedBox(width: 10,),
    InkWell(child: CircleAvatar(radius: 20,backgroundImage: AssetImage("images/wa.png", ),backgroundColor:Colors.blue.withOpacity(1) ,),onTap: (()async {
   var whatsappUrl =
          "whatsapp://send?phone=${"+201552770367"}";
          var url=Uri.parse(whatsappUrl);
           try {
        launchUrl(url);
      } catch (e) {
        //To handle error and display error message
       
      }
 
  
})),
    SizedBox(width: 10,),
    InkWell(child: CircleAvatar(radius: 17,backgroundImage: AssetImage("images/fa.png", ),backgroundColor:Colors.white.withOpacity(1) ,),onTap: (()async {
var url=Uri(scheme: 'tel',path: "+201552770367");
   if( await canLaunchUrl(url)){await launchUrl( url ) ;}

 
  
})),
    SizedBox(width: 10,),
        
  ],
),
SizedBox(height: 5,)

            ]),),
          );
        }));
      }, icon:Icon(Icons.menu)),
      
      ),
      
      body: gradients(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 3/2,mainAxisSpacing: 5,crossAxisSpacing: 5),
      children: widget.grid.map((e) => gridcard(name: e["name"], image: e["image"],screen: e["screen"],)).toList(),
          ),
        ),
      ),
    );
  }}