import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier{
 int _currentIndex = 0;
  get currentIndex => _currentIndex;

  updateIndex(int newIndex){
    _currentIndex =  newIndex;
     notifyListeners();
  } 
}