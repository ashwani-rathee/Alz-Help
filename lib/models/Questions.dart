import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';

getUserLocation() async {
  //call this async method from whereever you need
  dynamic currentLocation;
  LocationData myLocation;
  String error;
  Location location = new Location();
  try {
    myLocation = await location.getLocation();
  } on PlatformException catch (e) {
    if (e.code == 'PERMISSION_DENIED') {
      error = 'please grant permission';
      print(error);
    }
    if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
      error = 'permission denied- please enable it from app settings';
      print(error);
    }
    myLocation = null;
  }
  currentLocation = myLocation;
  final coordinates = new Coordinates(myLocation.latitude, myLocation.longitude);
  var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  print(
      ' ${first.countryName}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
  return first;
}

class Question {
  final int id, answer;
  final String question;
  final List<String> options;
  final String imglink;
  final String label;
  Question({this.id, this.question, this.answer, this.options, this.imglink, this.label});
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
int date = currDt.day;
int month = currDt.month;
int year = currDt.year;
int time = currDt.hour;
String place = '';
String city = 'Chandigarh';
// String country = 'India';

List sample_data = [
  {
    "id": 1,
    "question": "What is today's date?(from memory - no cheating!)",
    "options": ['${date - 1}', '${date}', '${date + 2}', '${date + 5}'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 2,
    "question": "Which is the month?",
    "options": ['$month', '${month + 1}', '${month + 2}', '${month + 3}'],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 3,
    "question": "What is the year?",
    "options": ['${year - 1}', '$year', '${year + 1}', '${year + 2}'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 4,
    "question": "What day is today?",
    "options": ['${days[0]}', '${days[day - 1]}', '${days[2]}', '${days[3]}'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 5,
    "question": "Which Country are you currently present in?",
    "options": ['UK', 'China', 'Canada', 'India'],
    "answer_index": 3,
    "imglink": '',
  },
  {
    "id": 6,
    "question": "What is the name of the city you currently are in?",
    "options": ['Chandigarh', 'Chicago', 'New York', 'London'],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 7,
    "question":
        "How are a watch and a ruler similar?  Write down how they are alike.  They both are... what?",
    "options": ['Circular', 'Measurement Tools', 'Dont Know', 'Straight'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 8,
    "question": "How many 20 cent pieces are in 2.40 dollar",
    "options": ['10', '11', '12', '14'],
    "answer_index": 2,
    "imglink": '',
  },
  {
    "id": 9,
    "question":
        "You are buying 13.40 dollar of groceries. How much change would you receive back from a 20 dollar note?",
    "options": ['7.20', '6.30', '6.60', '7.60'],
    "answer_index": 2,
    "imglink": '',
  },
  {
    "id": 10,
    "question": "What is 1004 divided by 2?",
    "options": ['54', '502', '52', '5002'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 11,
    "question": "What is the average of the numbers: 0, 0, 4, 10, 5, and 5 ?",
    "options": ['2', '3', '4', '5'],
    "answer_index": 2,
    "imglink": '',
  },
  {
    "id": 12,
    "question": "What is the value of x in the equation 3x – 15 – 6 = 0 ?",
    "options": ['7', '8', '9', '-9'],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 13,
    "question": "0.003 × 0.02 = ?",
    "options": ['0.6', '0.06', '0.006', '0.00006'],
    "answer_index": 3,
    "imglink": '',
  },
  {
    "id": 14,
    "question": "Combine terms: 12a + 26b -4b – 16a.",
    "options": ['4a + 22b', '-28a + 30b', '-4a + 22b', '28a + 30b'],
    "answer_index": 2,
    "imglink": '',
  },
  {
    "id": 15,
    "question": "What is this object called?",
    "options": ['Temple', 'Mosque', 'Church', 'House'],
    "answer_index": 2,
    "imglink": 'church.png',
  },
  {
    "id": 16,
    "question": "What is this object called?",
    "options": ['Apple', 'Orange', 'Banana', 'BlueBerry'],
    "answer_index": 1,
    "imglink": 'orange.png',
  },
  {
    "id": 17,
    "question": "What is this object called?",
    "options": ['Volcano', 'Tsunami', 'Sea', 'Land'],
    "answer_index": 0,
    "imglink": 'volcano.png',
  },
  {
    "id": 18,
    "question": "Memory Test.Tap on next for next question.Remember: Number : 84239",
    "options": ['Next'],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 19,
    "question": "What is this object called?",
    "options": ['Neem', 'Cactus', 'Eucalyptus', 'Ashoka'],
    "answer_index": 1,
    "imglink": 'cacti.png',
  },
  {
    "id": 19,
    "question": "Find Analogy: PETAL: FLOWER",
    "options": ['Pen: Paper', 'Engine: Car', 'Cat: Dog', 'Ball: Game'],
    "answer_index": 1,
    "imglink": '',
  },
  {
    "id": 20,
    "question": "Find Analogy: FRAME: PICTURE",
    "options": ['Criminal: Crime', 'River: Forest', 'Nail: Hammer', 'Binding: Book'],
    "answer_index": 3,
    "imglink": '',
  },
  {
    "id": 21,
    "question": "Marathon is to race as hibernation is to",
    "options": ['Bear', 'Dream', 'Winter', 'Sleep'],
    "answer_index": 2,
    "imglink": '',
  },
  {
    "id": 22,
    "question":
        "Memory Test.Tap on instruction for next question.Remember: Annie Loves Red,Pennie Loves Green",
    "options": [
      'Next',
    ],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 23,
    "question": "Find the pattern and choose appropriately",
    "options": ['A', 'B', 'C', 'D'],
    "answer_index": 1,
    "imglink": 'structure.png',
  },
  {
    "id": 24,
    "question": "Remember the phone number we told you in Ques 18",
    "options": ['84239', '83480', '89823', '89432'],
    "answer_index": 0,
    "imglink": '',
  },
  {
    "id": 25,
    "question": "What does Annie and Pennie love?",
    "options": [
      'Annie loves green',
      'Pennie loves Red',
      'Annie loves Red',
      'Annie,Pennie loves Green'
    ],
    "answer_index": 0,
    "imglink": '',
  },
];
