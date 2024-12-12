import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcoalworks/widgets/production_chart.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  final List<ProductionData> mockWeekData = [
    ProductionData(day: 'Mon', target: 15, achieved: 14),
    ProductionData(day: 'Tue', target: 16, achieved: 15),
    ProductionData(day: 'Wed', target: 17, achieved: 16),
    ProductionData(day: 'Thu', target: 15, achieved: 15),
    ProductionData(day: 'Fri', target: 16, achieved: 16),
    ProductionData(day: 'Sat', target: 14, achieved: 13),
    ProductionData(day: 'Sun', target: 13, achieved: 12),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hello Mathew!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Morning Shift - Section B',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            ProductionChart(weekData: mockWeekData)
          ],
        ),
      ),
    );
  }
}
