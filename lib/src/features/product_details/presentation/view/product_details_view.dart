import 'package:flutter/material.dart';
import 'package:grocery/src/features/product_details/presentation/component/product_details_component.dart';

class ProductDetailsView extends StatelessWidget {
  final String productid;

  const ProductDetailsView({super.key, required this.productid});

  @override
  Widget build(BuildContext context) {
    return ProductDetailsComponent(productid: productid);
  }
}
