import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:expense_tracker_flutter_app/widgets/category_widget.dart';
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

  TextEditingController categoryC=TextEditingController();

  TextEditingController dateC=TextEditingController();

  TextEditingController notesC=TextEditingController();

  String category="other";



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
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0
                      ),
                      ),
                  ],
                ),
              ),  
            
              CategoryWidget(),
          
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InputDatePickerFormField(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2028),
                        acceptEmptyDate: false,
                         onDateSaved: (value) {
                           dateC.text=value.toIso8601String();
                         },
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
                      double amount=double.parse(amountC.text);
                      String id=DateTime.now().toIso8601String(); 
                      DateTime date=DateTime.parse(dateC.text);
                      final cat=context.read<ExpenseProvider>().showCategory();
                      context.read<ExpenseProvider>().addExpense(
                        id, 
                        titleC.text, 
                        amount, 
                        date, 
                        cat, 
                        notesC.text
                        );
                  }, child: Padding(
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
}