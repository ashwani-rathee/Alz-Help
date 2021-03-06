class Orientation1 {
  final int id, answer;
  final String question;
  final List<String> options;

  Orientation1({this.id, this.question, this.answer, this.options});
}

var currDt = DateTime.now();
// print(currDt.year); // 4
// print(currDt.weekday); // 4
// print(currDt.month); // 4
// print(currDt.day); // 2
// print(currDt.hour); // 15
// print(currDt.minute); // 21
// print(currDt.second); // 49
List<String> days = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];

String day = '$currDt.weekday';
String date = '$currDt.day';
int month = currDt.month;
int year = currDt.year;
String time = '$currDt.hour';
String place = '';
String city = 'Chandigarh';
String country = 'India';

List sample_data = [
  {
    "id": 1,
    "question": "What is today's date?(from memory - no cheating!)",
    "options": ['6th', '$day', '12th', '21th'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Which is the month?",
    "options": ['$month', '${month + 1}', '${month + 2}', '${month + 3}'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "What is the year?",
    "options": ['${year - 1}', '$year', '${year + 1}', '${year + 2}'],
    "answer_index": 1,
  },
  {
    "id": 1,
    "question": "What is today's day?(from memory - no cheating!)",
    "options": ['6th', '"$date"th', '12th', '21th'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Which place are you currently present in?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "What is the name of the city you currently are in?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "What is the name of the city you currently are in?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
];
