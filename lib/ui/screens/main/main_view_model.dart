import 'package:e_commerce/ui/screens/main/tabs/categories/categories_screen.dart';
import 'package:e_commerce/ui/screens/main/tabs/fav/fav_screen.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/home_screen.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainViewModel extends Cubit{
  int currentIndex = 0;
  TextEditingController controller = TextEditingController();
  List<Widget> tabs = [
     HomeScreen(),
    CategoriesScreen(),
    FavScreen(),
    ProfileScreen(),
  ];
  MainViewModel():super(MainInitialState());


  set changeIndexOfClick(int index){

    currentIndex = index;
    emit(MainInitialState());
  }

}

class MainInitialState{}