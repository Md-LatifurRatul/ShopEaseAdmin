import 'package:flutter/material.dart';
import 'package:shop_ease_admin/features/views/dashboard/widgets/side_bar_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currentRoute = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //! Sidebar
          SideBarMenu(
            selectRoute: currentRoute,
            onMenuItemSelected: (route) {
              setState(() {
                currentRoute = route;
              });
            },
          ),

          //! Content Area
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.deepPurple[50],
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Text(
                      "Welcome to ShopEase Admin Panel",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
