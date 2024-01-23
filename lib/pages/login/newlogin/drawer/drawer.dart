
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/categories/home.dart';
import 'package:fac_app/pages/categories/newgridcategories.dart';
import 'package:fac_app/pages/login/newlogin/drawer/menudraer.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class drawer extends StatelessWidget{
   final List grid;
  final String role;
  ZoomDrawerController awesomeDrawerBarController=ZoomDrawerController();

   drawer({super.key, required this.grid, required this.role});
  @override
  Widget build(BuildContext context) {
    return   ZoomDrawer(
      isRtl: context.locale==Locale("ar")?true:false,
      clipMainScreen: false,
      style: DrawerStyle.style3,
      controller: awesomeDrawerBarController,
      mainScreenScale: 0.1,
      menuBackgroundColor: Colors.white,
      menuScreenWidth:  MediaQuery.of(context).size.width * 0.65,
      mainScreenTapClose: true,
openCurve:Curves.bounceInOut,
      menuScreen: menudrawer(),
      mainScreen: newgridcategories(grid:grid,role: role,),
      borderRadius: 24.0,
      showShadow: false,
      angle: 0,
      drawerShadowsBackgroundColor: Colors.grey,
      
      slideWidth: MediaQuery.of(context).size.width * 0.7,
    );
  }
  
}