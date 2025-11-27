import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/providers/theme_provider.dart';
import 'package:news/features/home/presentation/widgets/categories/category_item.dart';
import 'package:news/features/home/presentation/widgets/categories/category_list.dart';
import 'package:news/models/category_model.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final void Function(String) onTap;
  const CategoryWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Morning \n Check Out The Latset News",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16.h),
        CategoryList(onTap: onTap),
      ],
    );
  }
}
