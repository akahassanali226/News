import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/presentation/widgets/articles/article_widget.dart';
import 'package:news/features/home/presentation/widgets/categories/categoryWidget.dart';
import 'package:news/features/home/presentation/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ? "Home" : selectedCategory!),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Icon(Icons.search, size: 24.w),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: CustomDrawer(
          onTap: () {
            selectedCategory = null;
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: selectedCategory == null
            ? CategoryWidget(onTap: onCategoryClicked)
            : ArticleWidget(),
      ),
    );
  }

  void onCategoryClicked(String category) {
    selectedCategory = category;
    setState(() {});
  }
}
