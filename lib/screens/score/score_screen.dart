import 'dart:html';

import 'package:alzhelp/models/users.dart';
import 'package:alzhelp/screens/home/home.dart';
import 'package:alzhelp/screens/home/tutorial.dart';
import 'package:alzhelp/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/shared/constants.dart';
import 'package:alzhelp/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:provider/provider.dart';
import 'package:alzhelp/services/database.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    final user = Provider.of<Users>(context);
    final score = (_qnController.correctAns * 10);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                //WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
                Column(
                  children: [
                    Spacer(flex: 3),
                    Text(
                      "Score: " + score.toString() + " / ${_qnController.questions.length * 10}",
                      style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black),
                    ),
                    Spacer(flex: 3),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(Home());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Go to Home page",
                          style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                    InkWell(
                      onTap: () async {
                        if (snapshot.hasData) {
                          UserData userData = snapshot.data;
                          await DatabaseService(uid: user.uid).updateUserData(
                              userData.name, score, userData.dob, userData.gender, userData.place);
                          Navigator.pop(context);
                          Get.to(Home());
                        } else {
                          Loading();
                          Get.to(Home());
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Save Score to Profile",
                          style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                    // InkWell(
                    //   onTap: () async {
                    //     Get.to(Tutorial());
                    //   },
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width * 0.75,
                    //     alignment: Alignment.center,
                    //     padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    //     decoration: BoxDecoration(
                    //       gradient: kPrimaryGradient,
                    //       borderRadius: BorderRadius.all(Radius.circular(12)),
                    //     ),
                    //     child: Text(
                    //       "Tutorial",
                    //       style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
                    //     ),
                    //   ),
                    // ),
                    // Spacer(flex: 2),
                  ],
                )
              ],
            ),
          );
        });
  }
}
