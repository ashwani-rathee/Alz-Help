import 'package:alzhelp/models/users.dart';
import 'package:alzhelp/screens/home/tutorial.dart';
import 'package:alzhelp/screens/quiz/quiz_screen.dart';
import 'package:alzhelp/screens/wrapper.dart';
import 'package:alzhelp/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var location = Location().getLocation();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          'tutorial': (context) => Tutorial(),
          'quizscreen': (context) => QuizScreen(),
        },
      ),
    );
  }
}
