import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/colors_app.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../search/view/screen/search_screen.dart';
import '../../home_cubit/products_cubit/product_cubit.dart';
import '../widget/all_products_body.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: defaultAppBar(
            context: context,
            title:"All Products",
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         NavigationHelper.push(
            //             context: context, destination: SearchScreen());
            //       },
            //       icon: Icon(Icons.search)),
            // ],
            height: 60.h, style: TextStyles.black16),
        body: BlocProvider(
          create: (context) => sl<ProductsCubit>()..getProducts(),
          child: AllProductsBody(),
        ));
  }
}
