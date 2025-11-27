import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/source/remote/api_manager.dart';
import 'package:news/features/home/presentation/widgets/articles/article_list.dart';
import 'package:news/models/responses/source.dart';
import 'package:news/models/responses/SourcesResponse.dart';

class ArticleWidget extends StatefulWidget {
  final String category;
  const ArticleWidget({super.key, required this.category});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          Center(child: CircularProgressIndicator());
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
        SourcesResponse? sourcesResponse = snapshot.data;
        if (sourcesResponse?.status == "error") {
          return Column(
            children: [
              Text(sourcesResponse?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        List<Source> sourceResponsesList = sourcesResponse?.sources ?? [];
        return DefaultTabController(
          length: sourceResponsesList.length,
          child: Column(
            children: [
              TabBar(
                labelStyle: Theme.of(context).textTheme.labelLarge,
                unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
                dividerHeight: 0,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: sourceResponsesList
                    .map((source) => Tab(text: source.name))
                    .toList(),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: TabBarView(
                  children: sourceResponsesList
                      .map((source) => ArticleList())
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
