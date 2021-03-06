import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/constants.dart';
import 'package:alzhelp/controllers/drawing_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreenDrawing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DrawingController _qnController = Get.put(DrawingController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
