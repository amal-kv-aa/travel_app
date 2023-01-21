import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashProvider with ChangeNotifier {
  double linewidth = 50;
  int page = 0;

 PageController pageController = PageController();
  List<String> qts = [
    "“A good traveler has no fixed plans and is not intent on arriving.”",
    "“Travel brings power and love back into your life.”",
    "“Travel far enough, you meet yourself.”",
    "“The journey of a thousand miles begins with a single step.”"
  ];

  List<String> img = [
    "assets/4f7238120511bfe8dae2289a9615e3ac.jpg",
    "assets/dec462cce6e3bd7683e51ae88f312fb8.jpg",
        "assets/fe4c9763fb96dd02bd603a9424494b38.jpg",
    "assets/3d53925183c38c9fc984e68f1bc0b0c6.jpg"
  ];

  updateLine(int value, BuildContext context) {
    page = value;
    log(value.toString());
    notifyListeners();
    if (value <= 3) {
      linewidth = linewidth + (value * 50);
      log(linewidth.toString());
      notifyListeners();
    }
  }

List<Widget> getquates(){
  List<Widget>item=[];
  for (var i in qts) {
    item.add(
      Text(i,style:  GoogleFonts.anton(color: Colors.teal,
      fontSize: 20.sp),),
    );
  }
 return item;

}
  //================swipe====remove===============//
  Future<bool?> confirmDismiss(
      DismissDirection direction) async {
    if (direction == DismissDirection.startToEnd) {
      log("hey..");
    
      return true;
    } else if (direction == DismissDirection.endToStart) {
      
    }
    return null;
  }
}
