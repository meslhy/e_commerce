import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash_screen.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(
      BlocProvider(
        create:(context) => getIt<CartViewModel>() ,
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      themeMode:ThemeMode.light ,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
        MainScreen.routeName : (context) => MainScreen(),
        ProductDetailsScreen.routeName : (context) => ProductDetailsScreen(),
        CartScreen.routeName : (context) => CartScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
