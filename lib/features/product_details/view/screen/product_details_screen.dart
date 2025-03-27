import 'package:flutter/material.dart';
import 'package:furniture_app/features/product_details/view/widget/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBody(),
    );
  }
}
