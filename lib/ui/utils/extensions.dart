import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

extension ConnectivityExtension on Connectivity{

  Future<bool> get isInternetConnective async{

    ConnectivityResult result = await checkConnectivity();
    return result == ConnectivityResult.wifi || result == ConnectivityResult.mobile ? true : false;

  }
}

extension ScreenPercentage on num{
  double h(BuildContext context ){
    return MediaQuery.of(context).size.height *this;
  }

  double w(BuildContext context ){
    return MediaQuery.of(context).size.width *this;
  }
}