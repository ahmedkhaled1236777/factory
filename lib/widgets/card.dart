import 'package:fac_app/providers/providercategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/blow/blowing_page.dart';
import '../pages/finish/finish-page.dart';
import '../pages/injection/injection-page.dart';

class cards extends StatelessWidget{
  final String imageurl;
  final String depatement_name;
  final int index;
 cards({ required this.imageurl, required this.depatement_name,required this.index});


  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: (() {
       Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
         return Provider.of<categoriesprovider>(context).screans[index];
       })));
      }),
      child: Container(
        height: 300,
        width: double.infinity,
        child: Card(
          elevation: 10,
          child: Column(
            children: [
    Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(imageurl,fit: BoxFit.fill,),
    ),
    Text(depatement_name,style: Theme.of(context).textTheme.headline2,)
            ],
          ),
        ),
      ),
    );
  }

}