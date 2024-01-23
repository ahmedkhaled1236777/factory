import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/models/material/edits.dart';
import 'package:fac_app/pages/categories/newgridcategories.dart';
import 'package:fac_app/pages/injection/injection-page.dart';
import 'package:fac_app/pages/injection/newinjection.dart';
import 'package:fac_app/pages/login/newlogin/drawer/drawer.dart';
import 'package:fac_app/pages/login/newlogin/profile.dart';
import 'package:fac_app/pages/settings/newsettings.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget{
  final List grid;
  final String role;

  const home({super.key, required this.grid, required this.role});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<IconData> data = [
    Icons.person,
    Icons.home,
  if(cashhelper.getstringdata("role")=="manager"||cashhelper.getstringdata("role")=="admin")  Icons.settings,
   
  ];
  
  int index=1;
  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body:
      
       index==0?profile():index==1?drawer(grid: widget.grid, role: widget.role):newsettings(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 0,right: 0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(0),
          color: appcolors.kprimarycolor,
          child: Container(
            
            padding: EdgeInsets.symmetric(horizontal: 0),
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: data.map((e) => 
                  
                   Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = data.indexOf(e);
                            });
                          },
                          child: ClipPath(
                            clipper: mynavpath(),
                            child: AnimatedContainer(
                              height: 70,
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 500),
                              width: 60,
                              decoration: BoxDecoration(
                                border: data.indexOf(e) == index
                                    ? Border(
                                        top: BorderSide(
                                          
                                            width: 3.0, color: appcolors.kgreycolor))
                                    : null,
                                gradient: data.indexOf(e)== index
                                    ? LinearGradient(
                                        colors: [
                                            Color.fromARGB(255, 251, 249, 249),
                                            appcolors.kprimarycolor
                                          ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)
                                    : null,
                              ),
                              child: Icon(
                                e,
                                size: 35,
                                color: data.indexOf(e)== index
                                    ?Colors.white
                                    :  appcolors.amcolor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ).toList(),
            ),
          ),
        ),
      ),

  ));
  }
}
class mynavpath extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    double h=size.height;
  double w =size.width;
  final path_0=Path();
  path_0.moveTo(0, h);
  path_0.lineTo(w, h);
  path_0.lineTo(w*0.65,0);
  path_0.lineTo(w*0.35, 0);
  path_0.close();
       // path_0.moveTo(size.width*1.0044365,size.height*0.0020000);
    //path_0.lineTo(size.width*0,size.height*0);
    //path_0.quadraticBezierTo(size.width*0.0013334,size.height*0.2698571,size.width*0.0013334,size.height*0.3591429);
    //path_0.cubicTo(size.width*0.2574874,size.height*-0.0827857,size.width*0.4856246,size.height*0.4962143,size.width*1.0019350,size.height*0.3605714);
    //path_0.quadraticBezierTo(size.width*1.0025604,size.height*0.2709286,size.width*1.0044365,size.height*0.0020000);
   // path_0.close();


   return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
   return false;
  }

}