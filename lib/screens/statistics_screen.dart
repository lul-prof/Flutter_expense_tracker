import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(
      length: 3, 
      vsync:this,
      animationDuration: Duration(seconds: 1),
      initialIndex: 0,
      );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.amber,
            automaticIndicatorColorAdjustment: true,
            controller: _tabController,
            tabs: [
            Tab( 
              child: Text('Week'),),
            Tab(child: Text('Month'),),
            Tab(child: Text('Year'),),
          ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Week View')),
                Center(child: Text('Month View')),
                Center(child: Text('Year View')),
              ],
              ),
            ),
        ],
      ),

    
    );
  }
}