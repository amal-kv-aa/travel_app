import 'package:flutter/cupertino.dart';
import 'package:travel_app/screens/home/model/curted_models.dart';
import 'package:travel_app/service/api.dart';

class SlidingProvider with ChangeNotifier{
  SlidingProvider(){
    listener();
    getAdvisory();
  }

  PageController pageController  = PageController(viewportFraction: 0.8);
 double pageOffset = 0;
 
 CurtedModel? advisoryData;
 
 listener(){
  pageController.addListener(() {
    pageOffset = pageController.page!;
    notifyListeners();
  });
 }

getAdvisory(){
  ApiService().getAdvisroyData().then((value){
    if (value != null && value.err == null)
            {
             advisoryData = value;
              notifyListeners();
              }
          else if (value != null && value.err == "SocketException")
            {
              advisoryData = value;
              notifyListeners();
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       content: Text("check your internet connection")));
           }
          else
            {
              advisoryData = value;
              notifyListeners();
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(const SnackBar(content: Text("somthing went wrong..")));
            }
  });
}

}