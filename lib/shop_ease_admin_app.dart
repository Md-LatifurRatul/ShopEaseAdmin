import 'package:flutter/material.dart';
import 'package:shop_ease_admin/config/app_router.dart';
import 'package:shop_ease_admin/core/app_theme.dart';

class ShopEaseAdminApp extends StatelessWidget {
  const ShopEaseAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopEase Admin Panel",
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
