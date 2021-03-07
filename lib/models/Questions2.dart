import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);

class Question2 {
  final int id;
  final String question;
  final String answer;

  Question2({this.id, this.question, this.answer});
}

List sampleData = [
  {
    "id": 1,
    "question": "What is today's date?(yyyy-MM-dd) from memory",
    "answer": formatted,
  },
];
