import 'package:fac_app/pages/categories/newgrid.dart';
import 'package:fac_app/pages/categories/widget1.dart';
import 'package:fac_app/pages/categories/widget2.dart';
import 'package:flutter/material.dart';

class secondgrid extends StatefulWidget{
   bool x=false;

  @override
  State<secondgrid> createState() => _newgridState();
}

class _newgridState extends State<secondgrid> {
  @override
  Widget build(BuildContext context) {
   return   Scaffold(
    appBar: AppBar(leading: IconButton(onPressed: (){
    
                    Navigator.of(context).pushReplacement(_createRoute( newgrid()));

    }, icon: Icon(Icons.abc)),),
     body:widget.x==true?widget1():widget2(),
   );
  }
}
Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => destination,
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.bounceInOut, reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}