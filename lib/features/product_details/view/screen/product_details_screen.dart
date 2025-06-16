import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/features/cart/cubit/cart_cubit.dart';
import 'package:furniture_app/features/home/model/home_model/product_model.dart';
import 'package:furniture_app/features/product_details/view/widget/product_details_body.dart';
import '../../../../core/utils/service_locator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubit(sl()),
        child: ProductDetailsBody(
          productModel: productModel,
        ),
      ),
    );
  }
}
