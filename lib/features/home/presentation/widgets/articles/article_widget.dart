import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/presentation/widgets/articles/article_item.dart';
import 'package:news/features/home/presentation/widgets/articles/article_list.dart';

class ArticleWidget extends StatelessWidget {
  ArticleWidget({super.key});
  final List<String> dummySource = ["BBC", "jjoij", "WWE", "ioko", "Hahah"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dummySource.length,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.labelLarge,
            unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
            dividerHeight: 0,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: dummySource.map((source) => Tab(text: source)).toList(),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: TabBarView(
              children: dummySource.map((source) => ArticleList()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
