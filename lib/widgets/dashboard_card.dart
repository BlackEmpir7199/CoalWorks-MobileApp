import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DashboardWidget extends StatelessWidget {
  final List<InspectionData> inspectionData;

  const DashboardWidget({Key? key, required this.inspectionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Overman Inspection Dashboard', style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: inspectionData.length.toDouble() - 1,
              minY: 0,
              maxY: 10,
              lineBarsData: [
                LineChartBarData(
                  spots: inspectionData.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value.issuesCount.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text('Issues Trend', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class InspectionFormWidget extends StatefulWidget {
  final Function(InspectionData) onSubmit;

  const InspectionFormWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _InspectionFormWidgetState createState() => _InspectionFormWidgetState();
}

class _InspectionFormWidgetState extends State<InspectionFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String _mineName;
  late String _seam;
  late int _issuesCount;
  late String _remarks;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Mine Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter mine name';
              }
              return null;
            },
            onSaved: (value) => _mineName = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Seam'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter seam';
              }
              return null;
            },
            onSaved: (value) => _seam = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Number of Issues'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter number of issues';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) => _issuesCount = int.parse(value!),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Remarks'),
            maxLines: 3,
            onSaved: (value) => _remarks = value ?? '',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit(InspectionData(
                  date: DateTime.now(),
                  mineName: _mineName,
                  seam: _seam,
                  issuesCount: _issuesCount,
                  remarks: _remarks,
                ));
                _formKey.currentState!.reset();
              }
            },
            child: Text('Submit Inspection'),
          ),
        ],
      ),
    );
  }
}

class RecentInspectionsWidget extends StatelessWidget {
  final List<InspectionData> inspections;

  const RecentInspectionsWidget({Key? key, required this.inspections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: inspections.length,
      itemBuilder: (context, index) {
        final inspection = inspections[index];
        return ListTile(
          title: Text('${inspection.mineName} - ${inspection.seam}'),
          subtitle: Text(DateFormat('yyyy-MM-dd').format(inspection.date)),
          trailing: Text('Issues: ${inspection.issuesCount}'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Inspection Details'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Date: ${DateFormat('yyyy-MM-dd').format(inspection.date)}'),
                    Text('Mine: ${inspection.mineName}'),
                    Text('Seam: ${inspection.seam}'),
                    Text('Issues: ${inspection.issuesCount}'),
                    Text('Remarks: ${inspection.remarks}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class InspectionData {
  final DateTime date;
  final String mineName;
  final String seam;
  final int issuesCount;
  final String remarks;

  InspectionData({
    required this.date,
    required this.mineName,
    required this.seam,
    required this.issuesCount,
    required this.remarks,
  });
}