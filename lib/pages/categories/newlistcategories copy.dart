import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/categories/home.dart';
import 'package:fac_app/pages/login/newlogin/mypath.dart';
import 'package:fac_app/pages/login/newlogin/newchangepassword.dart';
import 'package:fac_app/pages/notifications/notification.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/providers/providerid.dart';
import 'package:fac_app/services/notifications/allnotifications.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:fac_app/widgets/gridcard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class newlistcategories extends StatefulWidget{
    final List grid;
    
final String role;
   newlistcategories({super.key, required this.grid,required this.role});
  @override
  State<newlistcategories> createState() => _newgridcategoriesState();
}

class _newgridcategoriesState extends State<newlistcategories> {
  bool list=false;
  int noty=0;
int index=1;
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

   return Column(
        children: [
            ClipPath(
          clipper: mypath(),
          child: Container(child: Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.3/4.5),
            child:                   Row(
              children: [
                if(widget.role=="manager"||widget.role=="admin")
badges.Badge(
  
  position: badges.BadgePosition.topStart(start: 25,top: 2),
  child: IconButton(onPressed: (()async {
 await allnotifications.deletenewnotification();
 Navigator.of(context).push(MaterialPageRoute(builder: (_){
  return notifications(number: noty,);
 }));
  }), icon: Icon(Icons.notifications,color: Colors.white)),
  badgeContent: StreamBuilder(builder:((context, snapshot) {
   
    if(snapshot.hasData){
    noty =snapshot.data!.size;
    return Text("${snapshot.data!.size}",style: TextStyle(color: Colors.white));}
    else return Text("0",style: TextStyle(color: Colors.white),);
    
  }) ,stream: material,),
)  ,
SizedBox(width: 5,),
GestureDetector(
  onTap: (){
  
  },
  child: ClipRRect(
  borderRadius: BorderRadius.circular(80),
  child: SizedBox(
    height: 40,
    width: 40,
    child: CachedNetworkImage(
      
      fit: BoxFit.fill,
      imageUrl: cashhelper.getstringdata("image")==null?"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbmB8QjPQMaiVi3yB0IckvPI1yiaYQLaAQ4g&usqp=CAU":cashhelper.getstringdata("image"),errorWidget: (context,url,Widget){
      return Icon(Icons.person,color: Colors.white,);
    },placeholder:(context,url){return CircularProgressIndicator();} ,),
  ),
) ),
Spacer(),
Text("main".tr(),style: TextStyle(fontFamily: "laila",fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),Spacer(),
IconButton(onPressed: (){
          ZoomDrawer.of(context)!.open();

}, icon: Icon(Icons.menu,color: Colors.white,))
              ],
            ),
      
          ),width: double.infinity,height: MediaQuery.of(context).size.height*0.28,color: appcolors.kprimarycolor,),)
        
         , Expanded(
           child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:
                        Hero(
                              tag: "aa",
                               child: AnimationLimiter(
                                  child: ListView.builder(itemCount: widget.grid.length,
                                  padding: EdgeInsets.all(0),
                                              itemBuilder: (context,Index) =>  AnimationConfiguration.staggeredList(position:Index,duration: const Duration(milliseconds: 600),
                                             child: SlideAnimation(delay:Duration(milliseconds: 300),child: FlipAnimation(child: SizedBox(height:120 ,child: Card(child: Row(children: [Image.asset(widget.grid[Index]["image"],fit: BoxFit.fill,width:100,height: double.infinity,)
                                           ,  Text(widget.grid[Index]["name"])
                                             ],),)))))),
                                  ),
                             )       
              ),
         ),
        ],
      )
    ;
  }
}