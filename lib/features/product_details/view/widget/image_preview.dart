import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView360 extends StatefulWidget {
  final List<String> imageUrls;

  const ProductView360({super.key, required this.imageUrls});

  @override
  State<ProductView360> createState() => _ProductView360State();
}

class _ProductView360State extends State<ProductView360> {
  int _currentIndex = 0;
  late double _dragStartX;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _dragStartX = details.localPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        final dragDistance = details.localPosition.dx - _dragStartX;

        // Determine how much to rotate based on drag distance
        if (dragDistance.abs() > 10) {
          final direction =
              dragDistance > 0 ? -1 : 1; // Reverse direction if needed
          setState(() {
            _currentIndex =
                (_currentIndex + direction) % widget.imageUrls.length;
            if (_currentIndex < 0) _currentIndex += widget.imageUrls.length;
          });
          _dragStartX = details.localPosition.dx;
        }
      },
      child: SizedBox(
        height: 260.h,
        child: Image.asset(
          widget.imageUrls[_currentIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
