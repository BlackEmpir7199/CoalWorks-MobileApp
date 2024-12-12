import 'package:flutter/material.dart';
import 'package:mcoalworks/widgets/critical_alerts.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              'Hello Lincoln!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
                        Text(
              'Morning Shift - Section B',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(height:10,),
            CriticalAlerts(),
          ],
        ),
      ),
    );
  }
}