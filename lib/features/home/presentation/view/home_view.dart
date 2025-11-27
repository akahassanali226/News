import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/source/remote/api_manager.dart';
import 'package:news/features/home/presentation/widgets/articles/article_widget.dart';
import 'package:news/features/home/presentation/widgets/categories/category_widget.dart';
import 'package:news/features/home/presentation/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String? selectedCategory;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                onChanged: (value) {
                  searchText = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              )
            : Text(selectedCategory == null ? "Home" : selectedCategory!),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),

            onPressed: () {
              setState(() {
                // Toggle search mode
                isSearching = !isSearching;

                // Clear text when closing search
                if (!isSearching) searchController.clear();
              });
            },
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
            : ArticleWidget(category: selectedCategory!),
      ),
    );
  }

  void onCategoryClicked(String category) {
    selectedCategory = category;
    setState(() {});
  }
}
