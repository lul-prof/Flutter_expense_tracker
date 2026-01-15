import 'package:expense_tracker_flutter_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> expense = [];

  ExpenseProvider({List<Expense>? expense}) : expense = expense ?? [];

  void addExpense(
    String id,
    String title,
    double amount,
    DateTime date,
    String category,
    String categoryImage,
    String note,
  ) {
    expense.add(
      Expense(
        id: id,
        title: title,
        amount: amount,
        date: date,
        category: category,
        categoryImage: categoryImage,
        notes: note,
      ),
    );

    notifyListeners();
  }

  void deleteExpense(int index) {
    expense.removeAt(index);
    notifyListeners();
  }

  void editExpense(
    int index,
    String title,
    double amount,
    DateTime date,
    String category,
    String categoryImage,
    String? note,
  ) {
    if (index >= 0 && index <= expense.length) {
      expense[index] = Expense(
        id: expense[index].id,
        title: title,
        amount: amount,
        date: date,
        category: category,
        categoryImage: categoryImage,
        notes: note,
      );
      notifyListeners();
    }
  }

  double get totalExpense {
    if (expense.isEmpty) return 0.0;

    return expense.fold(0.0, (sum, item) => sum + item.amount);
  }

  double get thisMonthExpense {
    if (expense.isEmpty) return 0.0;

    final now = DateTime.now();

    final currentMonth = DateTime(now.year, now.month);

    return expense
        .where(
          (exp) =>
              exp.date.year == currentMonth.year &&
              exp.date.month == currentMonth.month,
        )
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get averageExpense {
    if (expense.isEmpty) return 0.0;

    return totalExpense / expense.length;
  }

  int get thisMonthTransactionCount {
    if (expense.isEmpty) return 0;

    final now = DateTime.now();

    final currentMonth = DateTime(now.year, now.month);

    return expense
        .where(
          (exp) =>
              exp.date.year == currentMonth.year &&
              exp.date.month == currentMonth.month,
        )
        .length;
  }


}
