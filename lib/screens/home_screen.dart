import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mcoalworks/providers/auth_provider.dart';
import 'package:mcoalworks/providers/theme_provider.dart';
import 'package:mcoalworks/widgets/user_info_card.dart';
import 'package:mcoalworks/widgets/shift_log_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coal Mine Operations'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserInfoCard(user: authProvider.user!),
              const SizedBox(height: 24),
              const ShiftLogButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
