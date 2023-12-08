import 'package:flutter/material.dart';
import 'package:my_browser_app/util/shere_helper.dart';

class HomeProvider with ChangeNotifier {
  bool isOnline = false;
  String maritalSearch = "Google";
  String get maritalStatus => maritalSearch;
  List<String>? bookMarkData = [];
  double progressValue = 0;

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  void setMaritalStatus(String value) {
    maritalSearch = value;
    notifyListeners();
  }

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookMark();
    notifyListeners();
  }

  void setProgress(progress) {
    progressValue = progress / 100;
    notifyListeners();
  }
// void pullRefersh(progress)
// {
//   if (progress == 100) {
//     pullToRefreshController?.endRefreshing();
//     notifyListeners();
//   }
// }
}
