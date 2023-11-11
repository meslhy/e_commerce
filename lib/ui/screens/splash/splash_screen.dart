import 'package:e_commerce/data/model/responses/AuthResponse.dart';
import 'package:e_commerce/data/utils/shared_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName ="splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),()async{
      var prefs = getIt<SharedPrefsUtils>();

     User? user = await prefs.getUser();
     if(user == null){
       Navigator.pushReplacementNamed(context, LoginScreen.routeName);
     }else{
       Navigator.pushReplacementNamed(context, MainScreen.routeName);
     }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        fit: BoxFit.fill,
      ),
    );
  }
}
