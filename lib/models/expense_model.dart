class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final String? notes;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.notes,
  });

  Map<String,dynamic>toJson(){
    return{
      'id': id, 
      'title': title, 
      'amount': amount, 
      'date': date.toIso8601String(), 
      'category': category.toString(),
      'notes':notes
    };
  }

  factory Expense.fromJson(Map<String,dynamic>json){
    return Expense(
      id: json['id'], 
      title: json['id'], 
      amount: json['id'], 
      date: DateTime.parse(json['date']), 
      category: json['category'],
      notes: json['notes']
      );
  }
}

class Cat{
  String id;
  String title;

  Cat({
    required this.id,
    required this.title,
  });
}