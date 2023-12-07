import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class NetworkConnection {
  Connectivity networkConnectivity = Connectivity();

  Future<void> checkConnection(BuildContext context) async {
    ConnectivityResult result = await networkConnectivity.checkConnectivity();

    checkStatus(result,context);
    networkConnectivity.onConnectivityChanged.listen((event) {
      checkStatus(event,context);
    });
  }

  void checkStatus(ConnectivityResult result,BuildContext context) {
    if (result.index==1 || result.index==3) {
      context.read<HomeProvider>().changeStatus(true);
      print("InterNet is on");
    } else {
      context.read<HomeProvider>().changeStatus(false);
      print("InterNet is off");
    }
  }
}