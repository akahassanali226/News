import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/source/remote/api_manager.dart';
import 'package:news/features/home/presentation/widgets/articles/article_item.dart';
import 'package:news/models/articles/Article.dart';
import 'package:news/models/articles/ArticlesResponse.dart';
import 'package:news/models/responses/source.dart';

class ArticleList extends StatefulWidget {
  final Source source;
  const ArticleList({super.key, required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        ArticlesResponse? articlesResponse = snapshot.data;
        if (articlesResponse?.status == "error") {
          return Column(
            children: [
              Text(articlesResponse?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        List<Article> articlesResponseList = articlesResponse?.articles ?? [];

        return articlesResponseList == []
            ? Center(
                child: Text(
                  "No News Today",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ArticleItem(article: articlesResponseList[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h);
                },
                itemCount: articlesResponseList.length,
              );
      },
    );
  }
}
