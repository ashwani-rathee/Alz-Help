class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
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
  {
    "id": 3,
    "question": "Have you had any problems with memory or thinking?",
    "options": ['Yes', 'Only Occasionally', 'No'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question":
        "Have you had any blood relatives that have had problems with memory or thinking?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Do you have balance problems?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Have you ever had a major stroke?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "A minor or mini-stroke?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "Do you currently feel sad or depressed?",
    "options": ['Yes', 'No', 'Only Occasionally'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Have you had any change in your personality? ",
    "options": ['Yes(Specific Changes)', 'No'],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question":
        "Do you have more difficulties doing everyday activities due to thinking problems?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Name the following pictures(don’t worry about spelling)?",
    "options": ['Garland', 'Apple Banana', 'Round', 'circle'],
    "answer_index": 2,
  },
  {
    "id": 12,
    "question":
        "How are a watch and a ruler similar?  Write down how they are alike.  They both are... what?",
    "options": ['Circular', 'Measurement Tools', 'Dont Know', 'Straight'],
    "answer_index": 2,
  },
  {
    "id": 13,
    "question": "How many 20 cent pieces are in 2.40 dollar",
    "options": ['10', '11', '12', '14'],
    "answer_index": 2,
  },
  {
    "id": 14,
    "question":
        "You are buying 13.40 dollar of groceries. How much change would you receive back from a 20 dollar note?",
    "options": ['7.20', '6.30', '6.60', '7.60'],
    "answer_index": 2,
  },
  {
    "id": 15,
    "question":
        " Memory Test (memorize these instructions).  Do later only after completing this entire test:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
  {
    "id": 16,
    "question": "Copy this picture:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
  {
    "id": 17,
    "question":
        " Memory Test (memorize these instructions).  Do later only after completing this entire test:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
  {
    "id": 18,
    "question":
        " Memory Test (memorize these instructions).  Do later only after completing this entire test:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
  {
    "id": 19,
    "question":
        " Memory Test (memorize these instructions).  Do later only after completing this entire test:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
  {
    "id": 20,
    "question":
        " Memory Test (memorize these instructions).  Do later only after completing this entire test:",
    "options": [
      'At the bottom of the very last page: Write “I am done” on the blank line provided'
    ],
    "answer_index": 0,
  },
];
