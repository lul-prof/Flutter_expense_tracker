import 'package:flutter/animation.dart';

class Category {

  int id;
  String title;
  String imageUrl;
  Color color;
  bool isSelected;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.color,
    this.isSelected=false,
  });

}