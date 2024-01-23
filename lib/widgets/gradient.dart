import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gradients extends StatelessWidget{
  final Widget child;

  const gradients({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
   return Container(
    
    child: child,
    decoration: BoxDecoration(
 gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: [
            Colors.blue.withOpacity(0.3),
            Colors.blue.withOpacity(0.2),
            Colors.blue.withOpacity(0.1)
          ])
    ),
   );
  }

}
// GridView(padding: EdgeInsets.all(10),gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 3/2,
  //  mainAxisSpacing: 20,crossAxisSpacing: 20),
    //children:DUMMY_CATEGORIES.map((item) => catwidget(title: item.title, colora: item.color, id: item.id,imageUrl: item.imageUrl,)).toList() ,