import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:alzhelp/models/Questions2.dart';
import 'package:alzhelp/screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController2 extends GetxController with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question2> _questions = sampleData
      .map(
        (question) => Question2(
            id: question['id'], question: question['question'], answer: question['answer']),
      )
      .toList();
  List<Question2> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  String _correctAns;
  String get correctAns => this._correctAns;

  String _givenAns;
  String get selectedAns => this._givenAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController = AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question2 question, String filledAns) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _givenAns = filledAns;

    if (_correctAns == _givenAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
