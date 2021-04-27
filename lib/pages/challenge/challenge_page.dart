import 'package:DevQuiz/pages/challenge/quiz/quiz_widget.dart';
import 'package:DevQuiz/pages/challenge/widgets/question_indicator_widget/question_indicator_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallegenPage extends StatefulWidget {
  final String title;
  final List<QuestionModel> questions;

  const ChallegenPage({Key? key, required this.title, required this.questions}) : super(key: key); 
  @override
  _ChallegenPageState createState() => _ChallegenPageState();
}

class _ChallegenPageState extends State<ChallegenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget()),
        ),
        body: QuizWidget(title: "O que o Flutter faz em sua totalidade?",),
    );
  }
}