import 'package:expense_tracker_flutter_app/providers/category_provider.dart';
import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, categoryProvider, child) {
      return LayoutBuilder(builder: (context, constraints) {
        int crossAxisCount;
        if(constraints.maxWidth<=260){
          crossAxisCount=2;
        }else if(constraints.maxWidth>250 && constraints.maxWidth<=400){
          crossAxisCount=3;
        }else if(constraints.maxWidth>400 && constraints.maxWidth<600){
          crossAxisCount=4;
        }else{
          crossAxisCount=5;
        }
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.85,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                ), 
                itemCount: categoryProvider.category.length,
              itemBuilder: (context, index) {
                final category=categoryProvider.category[index];
                final isSelected=category.isSelected;
                return GestureDetector(
                  onTap:() {
                    categoryProvider.toggleCategory(index);
                    context.read<ExpenseProvider>().addCategory(category.id.toString(), category.title);
                  },
                  child: Card(
                    color: isSelected ? Colors.red : Colors.white ,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            category.imageUrl,
                            width: 40.0,
                            ),
                        ),
                            
                        Text(category.title),                          
                      ],
                    ),
                  ),
                );
              },
              ),
          ),
        );
      },);
    },);
  }
}