import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:expense_tracker_flutter_app/screens/edit_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({super.key});

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = DateTime(date.year, date.month, date.day);
    
    if (dateToCheck == today) {
      return 'Today';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM dd, yyyy').format(date);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child) {
        
      return SizedBox(
        height: 500.0,
        child: LayoutBuilder(builder: (context, constraints) {
          
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),

            itemCount: expenseProvider.expense.length,
            itemBuilder: (context, index) {
            final _expense=expenseProvider.expense[index];
            return SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ListTile(
                  tileColor: Colors.grey[300],
                  title: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(_expense.title)),
                  
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Row(
                         children: [
                          Icon(Icons.circle,
                          size: 5.0,
                          ),
                           Text( _expense.category),
                         ],
                       ),
                      
                       Row(
                         children: [
                          Icon(Icons.circle,
                          size: 5.0,
                          ),
                           Text(
                            formatDate(_expense.date)
                           ),
                         ],
                       ),
                      ],
                    ),
                  ),
                        
                  leading: Image.asset(_expense.categoryImage,
                   width: 30.0,
                  ),
                
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('ksh ${_expense.amount.toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0
                      ),
                      ),
                      IconButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return EditExpenseScreen(
                            index: index,
                            title: _expense.title, 
                            amount: _expense.amount, 
                            category: _expense.category, 
                            categoryImage: _expense.categoryImage, 
                            date: _expense.date, 
                            notes: _expense.notes
                            );
                        },));
                      }, 
                      icon: Icon(Icons.edit)
                      ),


                      IconButton(
                        onPressed: () {
                         expenseProvider.deleteExpense(index);
                      }, 
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  
                ),
              ),
            );
          },
          );
        
        },
        ),
      );
    },);
  }
}