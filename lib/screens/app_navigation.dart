import 'package:flutter/material.dart';
import 'package:mcoalworks/providers/navigation_provider.dart';
import 'package:mcoalworks/screens/emergency_splash_screen.dart';
import 'package:mcoalworks/screens/home_screen.dart';
import 'package:mcoalworks/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> _screens = [
      HomeScreen(),
      ProfileScreen() // Placeholder for "More" screen
    ];

    return Scaffold(
      body: _screens[_bottomNavIndex],
    );
  }
}
