import 'package:flutter/material.dart';

import '../widget/see_all_body.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SeeAllBody(),
    );
  }
}
