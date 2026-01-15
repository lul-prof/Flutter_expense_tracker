import 'package:expense_tracker_flutter_app/providers/category_provider.dart';
import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:expense_tracker_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController titleC=TextEditingController();

  TextEditingController amountC=TextEditingController();

  TextEditingController notesC=TextEditingController();

  String selectedCategory="other";
  String selectedCategoryImage="assets/images/other.png";


  DateTime selectedDate=DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.topRight,
              colors: <Color>[Colors.blue,Colors.deepPurple]
              ),
          ),
        ),
        title: Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 4.0
          ),
          ),
      ),

      body:SizedBox.expand(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0
                            ),
                            ),
                        ],
                      ),
                      TextFormField(
                        controller: titleC,
                        decoration: InputDecoration(
                          hint: Text('Coffee'),
                          border: OutlineInputBorder(),
                          ),
                      ),
                    ],
                  ),
                ),
          
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0
                            ),
                            ),
                        ],
                      ),
                      TextFormField(
                        controller: amountC,
                        decoration: InputDecoration(
                          hint: Text('5.50'),
                          border: OutlineInputBorder(),
                          ),
                      ),
                    ],
                  ),
                ),

                Text(selectedCategory.toString()),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0
                      ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Consumer<CategoryProvider>(
                            builder: (context, categoryProvider, child) {
                            return LayoutBuilder(builder: (context, constraints) {
                              int crossAxisCount;
                              double childAspectRatio;
                              if(constraints.maxWidth<=250){
                                crossAxisCount=1;
                                childAspectRatio=1.9;
                              }else if(constraints.maxWidth>250 && constraints.maxWidth<=400){
                                crossAxisCount=2;
                                childAspectRatio=1.35;
                              }else if(constraints.maxWidth>400 && constraints.maxWidth<=900){
                                crossAxisCount=3;
                                childAspectRatio=1.3;
                              }else{
                                crossAxisCount=5;
                                childAspectRatio=1.5;
                              }
                              return SizedBox(
                                height: 400,
                                child: GridView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:crossAxisCount,
                                    childAspectRatio: childAspectRatio,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    ),
                                  itemCount: categoryProvider.category.length,
                                  itemBuilder: (context, index) {
                                    final category=categoryProvider.category[index];
                                    return GestureDetector(
                                      onTap: () {
                                        context.read<CategoryProvider>().toggleCategory(index);
                                        setState(() {
                                          selectedCategory=category.title;
                                          selectedCategoryImage=category.imageUrl;
                                        });
                                      },
                                      child: Card(
                                        color: category.isSelected ? category.color :Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                category.imageUrl,
                                                width: 40.0,
                                                ),
                                              Text(category.title),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  ),
                              );
                            },);
                         }, ),
                        ],
                      ),
                  ],
                ),
              ),  
            
             
          
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InputDatePickerFormField(
                        onDateSubmitted:(value) {
                          selectedDate=value;
                        } ,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2027),
                        initialDate: selectedDate,
                        ),
                    ],
                  ),
                ),

            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Notes (Optional)',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0
                            ),
                            ),
                        ],
                      ),
                      TextFormField(
                        controller: notesC,
                        decoration: InputDecoration(
                          hint: Text('Add notes...'),
                          border: OutlineInputBorder(),
                          ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      minimumSize: Size(300.0, 50.0)
                    ),
                    onPressed: () {
                     if(titleC.text.isNotEmpty && amountC.text.isNotEmpty && selectedCategory.isNotEmpty){
                      final id=DateTime.now().toIso8601String();
                      final title=titleC.text;
                      final amount=double.parse(amountC.text);
                      final date=selectedDate;
                      final cat=selectedCategory;
                      final catImg=selectedCategoryImage;
                      final note=notesC.text;
                      
                      context.read<ExpenseProvider>().addExpense(
                        id, 
                        title, 
                        amount, 
                        date,
                        cat,
                        catImg,
                        note
                        );
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: Center(child: Text('Expense Added')),
                              content: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  },));
                                }, 
                                child: Text('Ok')
                                ),
                        );},
                          );
                     }
                     
                    }, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save Expense'),
                  )
                  ),
                ),
                 
                     
              ],
            ),
          ),
        ),
      ) ,
    );
  }
  @override
  void dispose() {
    titleC.dispose();
    amountC.dispose();
    notesC.dispose();
    super.dispose();
  }
}