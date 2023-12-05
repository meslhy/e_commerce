import 'package:e_commerce/ui/screens/cart/widget/cart_item.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  static const String routeName ="cartScreen";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 late CartViewModel cartViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartViewModel = BlocProvider.of(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
            "Cart"
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
        ],
      ),
      body: BlocBuilder<CartViewModel,dynamic>(
        builder:(context, state) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder:(context, index) {
                    return CartItem(cartProduct: cartViewModel.cartDM!.products![index]);
                  },
                itemCount: cartViewModel.cartDM?.products?.length??0 ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total price",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "EGP ${ (cartViewModel.cartDM!.totalCartPrice?? 0)}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                      child:  buildAddButton()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
 buildAddButton() {
   return ElevatedButton(
     onPressed: () {

     },
     style: TextButton.styleFrom(
       backgroundColor: AppColors.primaryColor,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16),
       ),
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Text("Check Out", style: Theme
             .of(context)
             .textTheme
             .titleMedium),
         const Icon(Icons.arrow_forward),
       ],
     ),
   );
 }
}
