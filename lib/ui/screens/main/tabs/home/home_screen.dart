import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:e_commerce/ui/utils/extensions.dart';
import 'package:e_commerce/ui/widgets/category_item.dart';
import 'package:e_commerce/ui/widgets/error_view.dart';
import 'package:e_commerce/ui/widgets/loading_widget.dart';
import 'package:e_commerce/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {


   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();
  late CartViewModel cartViewModel;

  @override
  void initState() {
    super.initState();

    viewModel.getAllCategories();
    viewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    cartViewModel = BlocProvider.of(context,listen: false);

    return SafeArea(
        child: ListView(
          children: [
            AppBar(
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                  "Home"
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primaryColor,
              titleTextStyle: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                fontSize: 20,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
            SizedBox(
              height:.30.h(context),
              child: BlocBuilder(
                bloc: viewModel.categoriesUseCase,
                builder: (context, state){
                  if(state is BaseRequestErrorState ){
                    return ErrorView(message: state.message) ;
                  }else if(state is BaseRequestSuccessState<List<CategoryDM>>){
                    return buildSlider(state.data);
                  }else{
                    return  LoadingWidget();
                  }
                },
              ),
            ),
            SizedBox(
              height:.30.h(context),
              child: BlocBuilder(
                bloc: viewModel.categoriesUseCase,
                  builder: (context, state){
                  if(state is BaseRequestErrorState ){

                     return ErrorView(message: state.message);

                  }else if(state is BaseRequestSuccessState<List<CategoryDM>>){
                    return buildCategoriesGrideView(state.data! , context);
                  }else{
                     return  LoadingWidget();
                  }
                  },
              ),
            ),
            SizedBox(
              height: .40.h(context),
              child: BlocBuilder(
                bloc: viewModel.productUseCase,
                  builder: (context, state){
                  if(state is BaseRequestErrorState ){
                     return ErrorView(message: state.message) ;
                  }else if(state is BaseRequestSuccessState<List<ProductDM>>){
                    return buildProductsListView(state.data!);
                  }else{
                     return const LoadingWidget();
                  }
                  },
              ),
            ),
          ],
        )
    );
  }

  Widget buildCategoriesGrideView(List<CategoryDM> list , BuildContext context) =>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 16.0 , top: 16.0),
        child: Text(
          "Categories",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      Expanded(
        child: GridView.builder(
          itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) => CategoryItem(list[index]),
        ),
      ),
    ],
  );

  Widget buildProductsListView(List<ProductDM> list) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 16.0 , top: 16.0),
        child: Text(
          "Home Appliance",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      Expanded(
        child: BlocBuilder<CartViewModel,dynamic>(
          builder:(context, state) {
            CartDM? cartDm = cartViewModel.cartDM;
            if(state is! BaseRequestLoadingState){
              return ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = list[index];
                  return ProductItem(product , cartViewModel.isProductInCart(product.id!)!=null);
                },
              );
            }else{
              return ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = list[index];
                  return ProductItem(product , cartViewModel.isProductInCart(product.id!)!=null);
                },
              );
            }

          },
        ),
      ),
    ],
  );

  Widget buildSlider(List<CategoryDM>? data) {
    return Column(
      children: [
        CarouselSlider(
            items: data!.map((data){
              return CachedNetworkImage(
                imageUrl: data.image!,
                errorWidget: (_, __, ___) => Image.asset(
                  AppAssets.icProfile,
                  height: MediaQuery.of(context).size.height * .21 ,
                  fit: BoxFit.fill,
                ),
                progressIndicatorBuilder: (_, __, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress,)),
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              height:MediaQuery.of(context).size.height * .3,
              aspectRatio: 16/9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.ease,

            )
        ),
      ],
    );
  }
  
  
}
