import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'label': 'All', 'icon': null},
    {'label': 'Chair', 'icon': Icons.chair},
    {'label': 'Sofa', 'icon': Icons.weekend},
    {'label': 'Desk', 'icon': Icons.table_chart},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h, // Adjust height responsively
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF3D5C56) : Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: Color(0xFF97A4A0), width: 1.w),
              ),
              child: Row(
                children: [
                  if (categories[index]['icon'] != null) ...[
                    Icon(
                      categories[index]['icon'],
                      size: 17.sp,
                      color: isSelected ? Colors.white : Color(0xFF3D5C56),
                    ),
                    SizedBox(width: 6.w),
                  ],
                  Text(
                    categories[index]['label'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Color(0xFF3D5C56),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
