

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/login/addsubuser.dart';
import 'package:fac_app/pages/settings/machines.dart';
import 'package:fac_app/pages/settings/shifts.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newsettings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: appcolors.seconderycolor.withOpacity(0.3),
body: 
    Container(width: double.infinity,height: double.infinity,child:

 Stack(children: [
    Container(padding: EdgeInsets.only(left: 35,right: 35),color: appcolors.kprimarycolor,height: MediaQuery.of(context).size.height*0.3,child: Row(children: [
      Icon(Icons.settings,color: Colors.white,size: 30,),
     SizedBox(width: 10,),
      Text("settings".tr(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white,fontFamily: "cairo"),)

    ],),),
    Positioned(right: 20,left: 20,bottom: 0,child: Container(decoration: BoxDecoration(color: appcolors.amcolor,borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20)
    )),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.7,child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        
        mainAxisSize: MainAxisSize.max,
      
        children: [
          SizedBox(height: 50,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [CircleAvatar(radius: 13,backgroundColor: appcolors.kprimarycolor,child: CircleAvatar(backgroundColor: Colors.white,radius: 11,child: CircleAvatar(radius: 6,backgroundColor: appcolors.kprimarycolor,),),),
          Container(width: 2,color: appcolors.kprimarycolor,height: 50,)])
          ,SizedBox(width: 10,),
         Text(Provider.of<categoriesprovider>(context).buttonsettings[0],style: TextStyle(fontFamily: "cairo",color: Colors.white,fontSize: 17),)
,Spacer(),
IconButton(onPressed: (){
    Provider.of<shiftsprovider>(context,listen: false).resetdepartementname();
            Provider.of<shiftsprovider>(context,listen: false).shiftname.clear();
             
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addshifts();
          })));
},icon: Icon(Icons.arrow_forward_ios,color: appcolors.thirdcolor,))

        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Column(children: [CircleAvatar(radius: 13,backgroundColor: appcolors.kprimarycolor,child: CircleAvatar(backgroundColor: Colors.white,radius: 11,child: CircleAvatar(radius: 6,backgroundColor: appcolors.kprimarycolor,),),),
          Container(width: 2,color: appcolors.kprimarycolor,height: 50,)]) ,SizedBox(width: 10,)
        , Text(Provider.of<categoriesprovider>(context).buttonsettings[1],style: TextStyle(fontFamily: "cairo",color: Colors.white,fontSize: 17),)
,Spacer(),
IconButton(onPressed: (){
    Provider.of<machinesprovider>(context,listen: false).resetdepartementname();
        Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addmachines();
          })));
},icon: Icon(Icons.arrow_forward_ios,color: appcolors.thirdcolor,))

        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Column(children: [CircleAvatar(radius: 13,backgroundColor: appcolors.kprimarycolor,child: CircleAvatar(backgroundColor: Colors.white,radius: 11,child: CircleAvatar(radius: 6,backgroundColor: appcolors.kprimarycolor,),),),
        ])        ,  SizedBox(width: 10,),
         Text(Provider.of<categoriesprovider>(context).buttonsettings[2],style: TextStyle(fontFamily: "cairo",color: Colors.white,fontSize: 17),)
,Spacer(),
IconButton(onPressed: (){
                    Provider.of<settingsprovider>(context,listen: false).resetdroprole();
           Provider.of<settingsprovider>(context,listen: false) .restemailandpassword();      
             
            Navigator.of(context).push(MaterialPageRoute(builder:((context) {
            return addsubuser();
          })));
},icon: Icon(Icons.arrow_forward_ios,color: appcolors.thirdcolor,))

        ],
      ),
      SizedBox(height: 20,),
       ],
      ),
    ),))
  
  ],),

   ));
  }

  
}