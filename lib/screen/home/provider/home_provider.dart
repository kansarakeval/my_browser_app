import 'package:flutter/material.dart';
import 'package:my_browser_app/screen/home/modal/home_modal.dart';

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

  String _maritalStatus = "Google";

  String get maritalStatus => _maritalStatus;

  void setMaritalStatus(String value) {
    _maritalStatus = value;
    notifyListeners();
  }
}