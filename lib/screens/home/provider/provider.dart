import 'package:flutter/material.dart';
import 'package:travel_app/screens/home/model/curted_models.dart';
import 'package:travel_app/service/api.dart';

class HomeProvider with ChangeNotifier{
HomeProvider(){
getDatas();
}
CurtedModel? data;

getDatas(){
    ApiService().getwalpapper().then((value) {
        if (value != null && value.err == null)
            {
             data = value;
              notifyListeners();
              }
          else if (value != null && value.err == "SocketException")
            {
              data = value;
              notifyListeners();
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       content: Text("check your internet connection")));
           }
          else
            {
              data = value;
              notifyListeners();
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(const SnackBar(content: Text("somthing went wrong..")));
            }
    });
    
    }
    }
        
            


