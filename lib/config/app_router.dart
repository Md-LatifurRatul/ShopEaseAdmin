import 'package:flutter/material.dart';
import 'package:shop_ease_admin/features/views/auth/screens/login_screen.dart';
import 'package:shop_ease_admin/features/views/banners/screens/banner_screen.dart';
import 'package:shop_ease_admin/features/views/banners/screens/edit_banner_screen.dart';
import 'package:shop_ease_admin/features/views/dashboard/screens/dashboard_screen.dart';
import 'package:shop_ease_admin/features/views/products/screens/edit_product_screen.dart';
import 'package:shop_ease_admin/features/views/products/screens/product_screen.dart';

class AppRouter {
  static const String login = "/";
  static const String dashboard = "/dashboard";
  static const String banners = "/banners";
  static const String products = "/products";
  static const String editBanner = "/edit-banner";
  static const String editProduct = "/edit-product";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case banners:
        return MaterialPageRoute(builder: (_) => const BannerScreen());
      case products:
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      case editBanner:
        // final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => EditBannerScreen(
                // existingTitle: args['title'],
                // existingImage: args['imageBytes'],
              ),
        );

      case editProduct:
        // final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => EditProductScreen(
                // name: args['name'],
                // price: args['price'],
                // rating: args['rating'],
                // description: args['description'],
                // image: args['image'],
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Defined"))),
        );
    }
  }
}
