import 'package:expense_tracker_flutter_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> category=[
    Category(
      id: 1, 
      title: 'Food', 
      imageUrl: 'assets/images/hamburger.png',
      color: Colors.amber,
      ),
      Category(
      id: 2, 
      title: 'Transport', 
      imageUrl: 'assets/images/transport.png',
      color: Colors.blue,
      ),

      Category(
      id: 3, 
      title: 'Shopping', 
      imageUrl: 'assets/images/shopping-cart.png',
      color: Colors.purple,
      ),

      Category(
      id: 4, 
      title: 'Fun', 
      imageUrl: 'assets/images/dance.png',
      color:Colors.pink,
      ),
      Category(
      id: 5, 
      title: 'Bills', 
      imageUrl: 'assets/images/faucet.png',
      color:Colors.red,
      ),

      Category(
      id: 6, 
      title: 'Health', 
      imageUrl: 'assets/images/heartbeat.png',
      color: Colors.green,
      ),

      Category(
      id: 7, 
      title: 'Other', 
      imageUrl: 'assets/images/other.png',
      color: Colors.grey,
      isSelected: true
      ),
  ];

  // Get the currently selected category
  Category? get selectedCategory {
    try {
      return category.firstWhere((cat) => cat.isSelected);
    } catch (e) {
      return null;
    }
  }

  void toggleCategory(int index){
    if(index>=0 && index<category.length){
      for(var cat in category){
        cat.isSelected=false;
      }
      category[index].isSelected= true;
      notifyListeners();
    }

  }


}