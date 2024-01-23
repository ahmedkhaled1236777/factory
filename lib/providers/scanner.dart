import 'dart:math';

import 'package:flutter/material.dart';

class scanerprovider extends ChangeNotifier{
  TextEditingController con=TextEditingController();
     int x=(Random().nextInt(1000))+1000;

  onchanged(val){
x=int.parse(val);
notifyListeners();
  }

initcon(){
   con=TextEditingController(text: x.toString());
   notifyListeners();

}
changeallvalues(val){
  x=int.parse(val);
  con=TextEditingController(text: val);
  notifyListeners();
  
  }}