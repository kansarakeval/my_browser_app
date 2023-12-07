import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{
  bool isOnline = false;

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }
}