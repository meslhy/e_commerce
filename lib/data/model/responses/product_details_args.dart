import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';

class ProductDetailsArgs {
  ProductDM productDM;
  CartProduct? cartProduct;

  ProductDetailsArgs({required this.productDM, required this.cartProduct});
}