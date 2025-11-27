import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/presentation/widgets/articles/article_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ArticleItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      itemCount: 10,
    );
  }
}
