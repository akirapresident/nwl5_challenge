import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/pages/challenge/challenge_page.dart';
import 'package:DevQuiz/pages/challenge/quiz/quiz_widget.dart';
import 'package:DevQuiz/pages/home/home_controller.dart';
import 'package:DevQuiz/pages/home/home_state.dart';
import 'package:DevQuiz/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/pages/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controler = HomeController();

  @override
  void initState() {
    super.initState();
    controler.getUser();
    controler.getQuizzes();
    controler.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controler.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(user: controler.user!),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LevelButtonWidget(
                        label: "Fácil",
                      ),
                      SizedBox(width: 5),
                      LevelButtonWidget(
                        label: "Médio",
                      ),
                      SizedBox(width: 5),
                      LevelButtonWidget(
                        label: "Difícil",
                      ),
                      SizedBox(width: 5),
                      LevelButtonWidget(
                        label: "Perito",
                      ),
                    ]),
                SizedBox(height: 24),
                Expanded(
                    child: GridView.count(
                  semanticChildCount: controler.quizzes!.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controler.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionAnswered / e.questions.length,
                            onTap: () {
                              print("Clicou");
                              controler.onCardTap(context, e);
                            },
                            completed:
                                "${e.questionAnswered} de ${e.questions.length}",
                          ))
                      .toList(),
                )),
              ],
            ),
          ));
    } else {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen)),
      ));
    }
  }
}
