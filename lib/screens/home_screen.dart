// ignore_for_file: sized_box_for_whitespace

import 'package:expense_tracker_flutter_app/screens/add_expense_screen.dart';
import 'package:expense_tracker_flutter_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';


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
              colors: <Color>[Colors.blue,Colors.deepPurple]
              ),
          ),
        ),
        actionsPadding: EdgeInsets.all(10.0),
        title: Text(
          'Expense Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 4.0
          ),
          ),
        actions: [
          IconButton(
            onPressed: () {    
          }, icon: Icon(Icons.stacked_bar_chart,
          color: Colors.white,
          ),
          ),
        ],

      ),

      body: ExpenseItem(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        splashColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddExpenseScreen();
          },));
      },
      child: Icon(Icons.add,
      color: Colors.white,
      ),
      ),
    );
  }
}