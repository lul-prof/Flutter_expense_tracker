import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getWeeklyData(ExpenseProvider provider) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    
    Map<int, double> dailyExpenses = {};
    
    for (var expense in provider.expense) {
      if (expense.date.isAfter(weekStart.subtract(const Duration(days: 1)))) {
        final dayIndex = expense.date.weekday - 1;
        dailyExpenses[dayIndex] = (dailyExpenses[dayIndex] ?? 0) + expense.amount;
      }
    }
    
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return List.generate(7, (index) => {
      'day': days[index],
      'amount': dailyExpenses[index] ?? 0.0,
      'index': index,
    });
  }

  List<Map<String, dynamic>> _getMonthlyData(ExpenseProvider provider) {
    final now = DateTime.now();
    Map<int, double> weeklyExpenses = {};
    
    for (var expense in provider.expense) {
      if (expense.date.year == now.year && expense.date.month == now.month) {
        final weekOfMonth = ((expense.date.day - 1) / 7).floor();
        weeklyExpenses[weekOfMonth] = (weeklyExpenses[weekOfMonth] ?? 0) + expense.amount;
      }
    }
    
    return List.generate(4, (index) => {
      'week': 'Week ${index + 1}',
      'amount': weeklyExpenses[index] ?? 0.0,
      'index': index,
    });
  }

  List<Map<String, dynamic>> _getYearlyData(ExpenseProvider provider) {
    final now = DateTime.now();
    Map<int, double> monthlyExpenses = {};
    
    for (var expense in provider.expense) {
      if (expense.date.year == now.year) {
        final monthIndex = expense.date.month - 1;
        monthlyExpenses[monthIndex] = (monthlyExpenses[monthIndex] ?? 0) + expense.amount;
      }
    }
    
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return List.generate(12, (index) => {
      'month': months[index],
      'amount': monthlyExpenses[index] ?? 0.0,
      'index': index,
    });
  }

  Widget _buildChart(List<Map<String, dynamic>> data, String labelKey) {
    if (data.isEmpty || data.every((d) => d['amount'] == 0.0)) {
      return const Center(
        child: Text(
          'No expenses to display',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final maxY = data.map((d) => d['amount'] as double).reduce((a, b) => a > b ? a : b);
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY * 1.2,
                minY: 0,
                barGroups: data.map((item) {
                  return BarChartGroupData(
                    x: item['index'] as int,
                    barRods: [
                      BarChartRodData(
                        toY: item['amount'] as double,
                        color: Colors.deepPurpleAccent,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '\$${value.toInt()}',
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < data.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              data[index][labelKey] as String,
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxY / 5,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildSummary(data),
        ],
      ),
    );
  }

  Widget _buildSummary(List<Map<String, dynamic>> data) {
    final total = data.fold<double>(0.0, (sum, item) => sum + (item['amount'] as double));
    final average = data.isEmpty ? 0.0 : total / data.where((d) => d['amount'] > 0).length;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem('Total', '\$${total.toStringAsFixed(2)}'),
          _buildSummaryItem('Average', '\$${average.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, child) {
          return Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.deepPurpleAccent,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.deepPurpleAccent,
                tabs: const [
                  Tab(child: Text('Week')),
                  Tab(child: Text('Month')),
                  Tab(child: Text('Year')),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildChart(_getWeeklyData(expenseProvider), 'day'),
                    _buildChart(_getMonthlyData(expenseProvider), 'week'),
                    _buildChart(_getYearlyData(expenseProvider), 'month'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}