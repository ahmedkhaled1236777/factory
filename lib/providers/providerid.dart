import 'package:flutter/cupertino.dart';

class providerid extends  ChangeNotifier{
  int id=0;

  increaseid(){
    id++;
    notifyListeners();
  }
}