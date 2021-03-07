import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/controllers/question_controller2.dart';
import 'package:alzhelp/models/Questions2.dart';

import 'package:alzhelp/shared/constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question2 question;

  @override
  Widget build(BuildContext context) {
    QuestionController2 _controller = Get.put(QuestionController2());
    final _formkey = GlobalKey<FormState>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Form(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headline6.copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
