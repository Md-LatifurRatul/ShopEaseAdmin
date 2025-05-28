import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ease_admin/core/app_theme.dart';

class ShopEaseAdminApp extends StatelessWidget {
  const ShopEaseAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ShopEase Admin Panel",

        theme: AppTheme.lightTheme,
      ),
    );
  }
}
