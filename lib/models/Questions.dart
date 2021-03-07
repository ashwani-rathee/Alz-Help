class Question {
  final int id, answer;
  final String question;
  final List<String> options;
  final String imglink;
  final String label;
  Question(
      {this.id,
      this.question,
      this.answer,
      this.options,
      this.imglink,
      this.label});
}

var currDt = DateTime.now();

// print(currDt.year); // 4
// 4
// print(currDt.month); // 4
// print(currDt.day); // 2
// print(currDt.hour); // 15
// print(currDt.minute); // 21
// print(currDt.second); // 49
<<<<<<< Updated upstream
List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
=======
List<String> days = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
>>>>>>> Stashed changes

int day = currDt.weekday;
int date = currDt.day;
int month = currDt.month;
int year = currDt.year;
int time = currDt.hour;
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
<<<<<<< Updated upstream
    "options": ['${days[0]}', '${days[day - 1]}', '${days[2]}', '${days[3]}'],
=======
<<<<<<< Updated upstream
    "options": ['${days[0]}', '$days[${day - 1}]', '${days[2]}', '${days[3]}'],
>>>>>>> Stashed changes
    "answer_index": 1,
=======
    "options": [
      // '${days[day - 1]}',
      // '${days[day]}',
      // '${days[day + 1]}',
      // '${days[day + 2]}',
      'HELLO',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Which place are you currently present in?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "What is the name of the city you currently are in?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question":
        "How are a watch and a ruler similar?  Write down how they are alike.  They both are... what?",
    "options": ['Circular', 'Measurement Tools', 'Dont Know', 'Straight'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "How many 20 cent pieces are in 2.40 dollar",
    "options": ['10', '11', '12', '14'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question":
        "You are buying 13.40 dollar of groceries. How much change would you receive back from a 20 dollar note?",
    "options": ['7.20', '6.30', '6.60', '7.60'],
    "answer_index": 2,
>>>>>>> Stashed changes
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
