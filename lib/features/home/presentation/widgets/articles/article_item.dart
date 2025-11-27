import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/models/articles/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher_string.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final url = article.url ?? "";

        await launchUrlString(url);
      },
      child: Container(
        height: 322.h,
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200.h,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error, size: 30.sp)),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                article.title ?? "",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 16.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.author ?? "",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  timeago.format(
                    DateTime.parse(article.publishedAt.toString()),
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
