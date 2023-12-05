import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  CartProduct cartProduct;
   CartItem({super.key,required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    print(cartProduct.price);
    return  Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2,color: AppColors.primaryColor)),
        height: MediaQuery
            .of(context)
            .size
            .height * .15,

        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery
                .of(context)
                .size
                .height * .15,
            width: MediaQuery
                .of(context)
                .size
                .width * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 1.2)
            ),
            child: Image.network(cartProduct.product?.imageCover ?? "",
                fit: BoxFit.fill),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(cartProduct.product?.title ?? "",
                                  maxLines: 1,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<CartViewModel>(context).
                                removeFromCart(cartProduct.product!.id!);
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: AppColors.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('EGP ${(cartProduct.price)! * (cartProduct.count)!??""}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        BlocProvider.of<CartViewModel>(context).
                                        removeFromCart(
                                            cartProduct.product!.id!);
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outline_rounded,
                                        color: AppColors.whiteColor,
                                        size: 28,
                                      ),
                                    ),
                                    Text(
                                      "${cartProduct.count}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        BlocProvider.of<CartViewModel>(context).
                                        addToCart(
                                            cartProduct.product!.id!);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline_rounded,
                                        color: AppColors.whiteColor,
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              )),
        ]),
      ),
    );;
  }
}
