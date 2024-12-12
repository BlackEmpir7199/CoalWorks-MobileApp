import 'package:flutter/material.dart';
import 'package:mcoalworks/screens/alert_page.dart';
import 'package:mcoalworks/screens/production_page.dart';
import 'package:mcoalworks/widgets/dashboard_circles.dart';
import 'package:mcoalworks/widgets/shift_log_status.dart';
import 'package:provider/provider.dart';
import 'package:mcoalworks/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CoalWorks Mobile'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Dashboard', icon: Icon(Icons.dashboard)),
            Tab(text: 'Production', icon: Icon(Icons.bar_chart)),
            Tab(text: 'Alerts', icon: Icon(Icons.warning)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_DashboardPage(), ProductionPage(), AlertPage()],
      ),
    );
  }
}

class _DashboardPage extends StatelessWidget {
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
            SizedBox(height: 16),
            DashboardCircles(),
            Text(
              'Shift Logs Updates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            ShiftLogStatus(
              progressPercentage: 0,
              isSubmitted: false,
              shiftLogUrl:
                  'https://cdc2-2409-40f2-305a-61f8-60db-1174-26c4-a559.ngrok-free.app/form/1',
            )
          ],
        ),
      ),
    );
  }
}

class _ProductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Production Details',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
