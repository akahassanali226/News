import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/asset_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl:
                  "https://tse2.mm.bing.net/th/id/OIP.2g7IoF5oU9H2J-cheF5GJgHaEo?rs=1&pid=ImgDetMain&o=7&rm=3",
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
              "monoifmoemfme",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 16.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dr.huhui", style: Theme.of(context).textTheme.labelSmall),
              Text(
                DateTime.now().toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
