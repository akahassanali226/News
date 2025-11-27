import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/providers/theme_provider.dart';
import 'package:news/features/home/presentation/widgets/categories/category_item.dart';
import 'package:news/models/category_model.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  final void Function(String) onTap;
  const CategoryList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoryItem(
            onTap: onTap,
            index: index,
            category: provider.mode == ThemeMode.light
                ? CategoryModel.categoriesListLight[index]
                : CategoryModel.categoriesListdark[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        itemCount: CategoryModel.categoriesListLight.length,
      ),
    );
  }
}
