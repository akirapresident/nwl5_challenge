import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/pages/challenge/challenge_page.dart';
import 'package:DevQuiz/pages/home/home_repository.dart';
import 'package:DevQuiz/pages/home/home_state.dart';
import 'package:DevQuiz/pages/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  final repostory = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    // state = HomeState.loading;
    user = await repostory.getUser();
    state = HomeState.success;

  }
  onCardTap(BuildContext context, QuizModel e){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChallegenPage(title: e.title, questions: e.questions)));
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = await repostory.getQuizzes();
    state = HomeState.success;
  }
  
}