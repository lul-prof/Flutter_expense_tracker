import 'package:expense_tracker_flutter_app/providers/category_provider.dart';
import 'package:expense_tracker_flutter_app/providers/expense_provider.dart';
import 'package:expense_tracker_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ExpenseProvider();
        },),

        ChangeNotifierProvider(create: (context) {
          return CategoryProvider();
        },),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
