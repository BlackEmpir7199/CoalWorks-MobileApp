import 'package:flutter/material.dart';

class DashboardCircles extends StatelessWidget {
  const DashboardCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 600
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _buildDashboardItems(),
                    )
                  : Column(
                      children: _buildDashboardItems(),
                    );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDashboardItems() {
    return [
      _DashboardItem(
        icon: Icons.people,
        value: '172',
        percentage: '+1.92%',
        label: 'Active Workers',
        color: Colors.blue,
      ),
      _DashboardItem(
        icon: Icons.build,
        value: '42',
        percentage: '+1.89%',
        label: 'Active Equipment',
        color: Colors.green,
      ),
      _DashboardItem(
        icon: Icons.warning,
        value: '3',
        percentage: '-0.92%',
        label: 'Safety Incidents',
        color: Colors.orange,
      ),
    ];
  }
}

class _DashboardItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String percentage;
  final String label;
  final Color color;

  const _DashboardItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.percentage,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    percentage.startsWith('+')
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 16,
                    color: percentage.startsWith('+') ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 4),
                  Text(
                    percentage,
                    style: TextStyle(
                      color: percentage.startsWith('+') ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

