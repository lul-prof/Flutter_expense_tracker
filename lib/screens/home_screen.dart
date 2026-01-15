// ignore_for_file: sized_box_for_whitespace

import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:expense_tracker_flutter_app/screens/add_expense_screen.dart';
import 'package:expense_tracker_flutter_app/screens/statistics_screen.dart';
import 'package:expense_tracker_flutter_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.topRight,
              colors: <Color>[Colors.blue, Colors.deepPurple],
            ),
          ),
        ),
        actionsPadding: EdgeInsets.all(10.0),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            'Expense Tracker',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 4.0,
              fontSize: 14.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return StatisticsScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.stacked_bar_chart, color: Colors.white),
          ),
        
        ],
      automaticallyImplyLeading: false,
      ),

      body: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, child) {
          final _expense = expenseProvider.expense;
          return _expense.isEmpty
              ? Center(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.money_off, color: Colors.red, size: 50.0),
                        SizedBox(height: 6.0),
                        Text(
                          'No expenses yet',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Press + to add',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w700,
                            fontSize: 19.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.brown[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/bank-card.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Total Expense',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'kes ${expenseProvider.totalExpense.toString()}',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(width: 10.0),

                                      Container(
                                        width: 150,
                                        height: 150,

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.grey[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/salary.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'This Month',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Kes ${expenseProvider.thisMonthExpense}',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10.0),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.blue[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/faucet.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Average',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Kes ${(expenseProvider.averageExpense).toStringAsFixed(2)}',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(width: 10.0),

                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.pink[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/heartbeat.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Transactions',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              expenseProvider.expense.length
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent transactions',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'See All',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(),

                          ExpenseItem(),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        splashColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddExpenseScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
