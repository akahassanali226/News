import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/providers/theme_provider.dart';
import 'package:news/core/source/local/prefs_manager.dart';
import 'package:news/core/utils/app_style.dart';
import 'package:news/core/utils/route_manager.dart';
import 'package:news/features/home/presentation/view/home_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..init(),
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyle.lightTheme,
        darkTheme: AppStyle.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: RouteManager.homeRoute,
        routes: {RouteManager.homeRoute: (_) => HomeView()},
      ),
    );
  }
}
