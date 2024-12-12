import 'package:flutter/material.dart';
import 'package:mcoalworks/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ShiftLogButton extends StatelessWidget {
  const ShiftLogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return ElevatedButton(
      onPressed: user?.isSupervisor == true
          ? () {
              // TODO: Implement shift log submission
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Shift log submitted')),
              );
            }
          : null,
      child: Text('Submit Shift Log'),
    );
  }
}
