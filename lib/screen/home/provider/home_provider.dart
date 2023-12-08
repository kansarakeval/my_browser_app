import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_browser_app/screen/home/modal/home_modal.dart';
import 'package:my_browser_app/util/shere_helper.dart';
class HomeProvider with ChangeNotifier{
  bool isOnline = false;


  List<HomeModel> services =[
    HomeModel(link: "https://myaadhaar.uidai.gov.in/genricDownloadAadhaar"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/du"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/verify-email-mobile"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/genricPVC"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/check-aadhaar-validity"),
    HomeModel(link: "https://www.myntra.com/shop/women"),
  ];

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }

  String maritalSearch = "Google";

  String get maritalStatus => maritalSearch;

  void setMaritalStatus(String value) {
    maritalSearch = value;
    notifyListeners();
  }

  List<String>? bookMarkData = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookMark();
    notifyListeners();
  }

  double progressValue = 0.0;
  void setProgress(progress)
  {
    progressValue=progress/100;
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