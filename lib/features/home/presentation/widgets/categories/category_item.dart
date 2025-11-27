import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final void Function(String) onTap;
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
      child: InkWell(
        onTap: () {
          onTap(category.title);
        },
        child: Container(
          height: 198.4.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: AssetImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 54.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Theme.of(
                          context,
                        ).scaffoldBackgroundColor.withValues(alpha: 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                            child: Text(
                              "View All",
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 27.r,
                            backgroundColor: Theme.of(
                              context,
                            ).scaffoldBackgroundColor,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
