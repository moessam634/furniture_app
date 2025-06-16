import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniture_app/core/styles/colors_app.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (image.isNotEmpty) ? image : "",
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SpinKitFadingCircle(color: ColorsApp.kPrimaryColor, size: 25),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
