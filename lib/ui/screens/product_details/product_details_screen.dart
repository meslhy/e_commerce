import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';


class ProductDetailsScreen extends StatefulWidget {
  static String routeName = "productDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  late ProductDM productDM;
  late CartViewModel cartViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartViewModel = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {

    productDM = ModalRoute.
    of(context)!.
    settings.
    arguments as ProductDM ;

      return  Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
              "Product details"
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
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ImageSlideshow(
                              initialPage: 0,
                              indicatorColor: AppColors.primaryColor,
                              indicatorBackgroundColor: AppColors.whiteColor,
                              indicatorBottomPadding: 20,
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children:productDM.images
                                  ?.map((link) =>
                                  CachedNetworkImage(imageUrl: link))
                                  .toList() ??
                                  []),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              productDM.title ?? '',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                fontSize: 18,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "EGP ${productDM.price}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "Sold : ${productDM.sold}",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${productDM.ratingsAverage}(${productDM.quantity})",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Description",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(
                        productDM.description ?? '',
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          fontSize: 14,
                          color: AppColors.primaryColor.withOpacity(
                            0.6,
                          ),
                        ),
                        trimCollapsedText: ' Show More',
                        trimExpandedText: ' Show Less',
                        moreStyle: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                        lessStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CartViewModel, dynamic>(
                  builder: (context, state) =>
                      Row(
                        children: [
                          if(cartViewModel.isProductInCart(productDM.id!) != null)
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
                                  "EGP ${(productDM.price! * (cartViewModel.isProductInCart(productDM.id!)!.count ?? 0))}",
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
                          if(cartViewModel.isProductInCart(productDM.id!) != null)
                            const SizedBox(
                            width: 32,
                          ),
                          if(cartViewModel.isProductInCart(productDM.id!) != null)
                            Expanded(
                            child:  buildCartOptions()
                          ),

                          if(cartViewModel.isProductInCart(productDM.id!) ==null)
                            Expanded(
                                child:  buildAddButton()
                            ),
                        ],
                      )),
            ],
          ),
        ),
      ) ;
  }


  buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        cartViewModel.addToCart(productDM.id!);
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
          const Icon(Icons.add_shopping_cart_outlined),
          Text("Add to cart", style: Theme
              .of(context)
              .textTheme
              .titleMedium),
        ],
      ),
    );
  }

  buildCartOptions() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              cartViewModel.removeFromCart(productDM.id!);
            },
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 28,
            ),
          ),
          Text(
            "${cartViewModel.isProductInCart(productDM.id!)!.count}",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              cartViewModel.addToCart(productDM.id!);
            },
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

}

