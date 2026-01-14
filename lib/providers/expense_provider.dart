import 'package:expense_tracker_flutter_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  
  List<Expense> expense=[];
  List<Cat> category=[];

  ExpenseProvider({
    List<Expense>? expense,
  }) : expense=expense ?? [];

  void addExpense(String id, String title, double amount, DateTime date, String category,String note){
    expense.add(
      Expense(
        id: id, 
        title: title, 
        amount: amount, 
        date: date, 
        category: category,
        notes: note
        ));
        notifyListeners();
  }

  void addCategory(String id, String title){
    category.add(Cat(id: id, title: title));
    notifyListeners();
  }

  void showCategory(int index){
    category[index].title;
  }

}