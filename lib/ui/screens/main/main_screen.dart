import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:e_commerce/ui/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main";

   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    CartViewModel viewModel = BlocProvider.of(context);
    viewModel.getLoggedUserCart();

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder:(context, state) =>  Scaffold(
        body: viewModel.tabs[viewModel.currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  buildBottomNavIcon(String asset, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ImageIcon(
              AssetImage(asset),
              size: 30,
            ))
            : ImageIcon(AssetImage(asset), size: 30),
        label: "");
  }

  buildBottomNavigationBar(BuildContext context) =>Theme(
    data: ThemeData(canvasColor: AppColors.primaryColor),
    child: BottomNavigationBar(
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryColor,
      showSelectedLabels: false,
      onTap: (index) {
        viewModel.changeIndexOfClick = index;
      },
      iconSize: 35,
      currentIndex: viewModel.currentIndex,
      items: [
        buildBottomNavIcon(
            AppAssets.icHome, viewModel.currentIndex == 0),
        buildBottomNavIcon(
            AppAssets.icCategories,viewModel.currentIndex == 1),
        buildBottomNavIcon(
            AppAssets.icFav, viewModel.currentIndex == 2),
        buildBottomNavIcon(
            AppAssets.icProfile, viewModel.currentIndex == 3),
      ],
    ),
  );

  buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: .12.h(context),
      elevation: 0.00,
      backgroundColor: AppColors.whiteColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "E-Commerce",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primaryColor),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: viewModel.controller,
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: AppColors.primaryColor,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: AppColors.primaryColor,width: 2)
                    ),
                    filled: true,
                    fillColor:AppColors.whiteColor,
                    hintText: "Search Article",
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.lightBlue,fontSize: 18),
                    border: InputBorder.none,
                  ),
                  cursorColor: AppColors.primaryColor,
                  cursorHeight: 20,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primaryColor , fontSize: 18),

                ),
              ),
              SizedBox(width: 10,),
              Icon(Icons.shopping_cart_outlined, color: AppColors.primaryColor,size: 32,),
            ],
          ),
        ],
      ),
    );
  }
}
