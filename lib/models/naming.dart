class Naming {
  final int id, answer;
  final String question;
  final List<String> options;

  Naming({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What is today's date?(from memory - no cheating!)",
    "options": ['6-3-2021', '7-3-2021', '8-3-2021', '9-3-21'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Which regions are you from?",
    "options": ['European', 'Asian', 'American', 'Other'],
    "answer_index": 2,
  },
];
