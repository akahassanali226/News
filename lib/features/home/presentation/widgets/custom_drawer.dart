import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final void Function() onTap;
  const CustomDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 166.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Text("News", style: Theme.of(context).textTheme.titleLarge),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: InkWell(
                    onTap: onTap,
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Go To Home",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Theme.of(context).scaffoldBackgroundColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
