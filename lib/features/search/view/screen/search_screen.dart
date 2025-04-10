import 'package:flutter/material.dart';
import 'package:furniture_app/core/widgets/custom_app_bar.dart';
import 'package:furniture_app/core/widgets/custom_search_container.dart';
import '../widget/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(),
    );
  }
}
