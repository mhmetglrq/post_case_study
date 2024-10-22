import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_case_study/routes/app_pages.dart';
import 'package:post_case_study/routes/app_routes.dart';

import 'config/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Post Study Case',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      theme: AppTheme.lightTheme(context),
    );
  }
}
