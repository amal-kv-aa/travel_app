


import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier{

  double linewidth = 70;
  int page = 0;
  updateLine(int value,BuildContext context){
  page = value;
   if (value <= 3) {
     linewidth = linewidth + (value * 50);
    notifyListeners();
   }

   
  }


}