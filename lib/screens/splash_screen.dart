import 'package:flutter/material.dart';
import 'package:mcoalworks/screens/app_navigation.dart';
import 'package:provider/provider.dart';
import 'package:mcoalworks/providers/auth_provider.dart';
import 'package:mcoalworks/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating some loading time
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.checkLoginStatus();

    if (true) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AppNavigation()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
