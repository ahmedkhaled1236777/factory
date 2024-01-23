import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class widget2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  ListView.builder(itemCount: 6,
   physics: NeverScrollableScrollPhysics(),
   padding: EdgeInsets.all(0),
               itemBuilder: (context,Index) =>  Column(
                 children: [
                   Hero(
                    tag: Index,
                    
                     child: Container(color: Colors.amber,height:120 ,child: Center(child: Text("${Index}"),),
                     
                     ),
                   ),
                   SizedBox(height: 5,)
                 ],
               ));
                                   
  }

}
class CustomRectTween extends MaterialRectCenterArcTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a, b;

  @override
  Rect lerp(double t) {
    final double myCurve = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, myCurve),
      lerpDouble(a.top, b.top, myCurve),
      lerpDouble(a.right, b.right, myCurve),
      lerpDouble(a.bottom, b.bottom, myCurve),
    );
  }

  double lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => destination,
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCirc, reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}