class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

var currDt = DateTime.now();

// print(currDt.year); // 4
// 4
// print(currDt.month); // 4
// print(currDt.day); // 2
// print(currDt.hour); // 15
// print(currDt.minute); // 21
// print(currDt.second); // 49
List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

int day = currDt.weekday;
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
    "id": 4,
    "question": "What day is today?",
    "options": ['${days[0]}', '${days[day - 1]}', '${days[2]}', '${days[3]}'],
    "answer_index": 1,
  },
  // {
  //   "id": 1,
  //   "question": "Flutter is an open-source UI software development kit created by ______",
  //   "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 2,
  //   "question": "When google release Flutter.",
  //   "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 3,
  //   "question": "A memory location that holds a single letter or number.",
  //   "options": ['Double', 'Int', 'Char', 'Word'],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 4,
  //   "question": "What command do you use to output data to the screen?",
  //   "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
  //   "answer_index": 2,
  // },
];
