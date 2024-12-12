import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mcoalworks/providers/auth_provider.dart';
import 'package:mcoalworks/widgets/user_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UserInfoCard(user: authProvider.user!),
              // Add more profile related widgets here
            ],
          ),
        ),
      ),
    );
  }
}

