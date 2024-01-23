import 'package:fac_app/pages/categories/secondgrid.dart';
import 'package:fac_app/pages/categories/widget1.dart';
import 'package:fac_app/pages/categories/widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class newgrid extends StatefulWidget{
   bool x=true;

  @override
  State<newgrid> createState() => _newgridState();
}

class _newgridState extends State<newgrid> {
  @override
  Widget build(BuildContext context) {
   return   Scaffold(
    appBar: AppBar(leading: IconButton(onPressed: (){
    
                    Navigator.of(context).pushReplacement(_createRoute( secondgrid()));

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