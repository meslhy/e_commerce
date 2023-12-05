import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/shared_view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class ProductItem extends StatefulWidget {

  final ProductDM productDM;
  late final bool isInCart ;

  ProductItem(this.productDM ,this.isInCart);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width * .4,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBlue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments:widget.productDM);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  widget.productDM.imageCover!,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Image.asset(
                  AppAssets.icFav,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            const Spacer(),
            Text(
              widget.productDM.title!,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: TextStyle(height: 1),
            ),
            const Spacer(),
            Row(
              children: [
                Text("Review(${widget.productDM.ratingsAverage})"),
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
              ],
            ),
            Row(
              children: [
                Text("EGP ${widget.productDM.price} "),
                const Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    heroTag: "${widget.productDM.title}",
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      CartViewModel cartViewModel = BlocProvider.of(context);
                      if(widget.isInCart){
                        print(cartViewModel.cartDM!.products!.length);
                        cartViewModel.removeFromCart(widget.productDM.id!);
                      }else{
                        cartViewModel.addToCart(widget.productDM.id!);
                      }
                    },
                    child:Icon(
                      widget.isInCart? Icons.remove : Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}