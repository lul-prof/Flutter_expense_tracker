import 'package:expense_tracker_flutter_app/screens/statistics_screen.dart';
import 'package:expense_tracker_flutter_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class EditExpenseScreen extends StatelessWidget {
  const EditExpenseScreen({super.key});

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
          'Update Expense',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 4.0
          ),
          ),

          actions: [
            IconButton(
              onPressed: () {
              
            }, icon: Icon(Icons.delete,
            color: Colors.white,
            ),
            ),
          ],
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
            
              CategoryWidget()
          
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InputDatePickerFormField(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2028),
                        acceptEmptyDate: false,
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return StatisticsScreen();
                      },));
                  }, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Update Expense'),
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